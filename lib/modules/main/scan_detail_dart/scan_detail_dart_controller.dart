import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/save_item_mark_model.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model_by_id.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_controller.dart';
import 'package:flutter_getx_base/shared/sharepreference.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_editor_plus/image_editor_plus.dart' as editorImage;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '../../../models/save_item_pdf_scan_model.dart';
import '../../../models/save_item_scan_ocr_model.dart';
import '../../../shared/widgets/common_widget.dart';
import '../components/bottomsheet.dart';

class ScanDetailDartController extends GetxController {
  RxList<ScanOCRListWithId> listScanned = <ScanOCRListWithId>[].obs;
  Rx<SaveItemWaterMark?> saveItemWaterMark = Rx<SaveItemWaterMark?>(null);
  RxList<SaveItemWaterMark> waterMarkList = <SaveItemWaterMark>[].obs;

  final TextEditingController createWaterMarkController =
      TextEditingController();
  final GlobalKey<FormState> createWaterMarkFormKey = GlobalKey<FormState>();
  Rx<String>? croppedFilePath = ''.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getListScanTextDetail();
    getListWaterMark();
  }

  HomeController homeController = Get.find();

  Future<void> cropImage(BuildContext context, PdfScan pdfScan) async {
    if (pdfScan.filePath.isNotEmpty) {
      var croppedFile = await ImageCropper().cropImage(
        sourcePath: pdfScan.filePath,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        await SharedPreferencesManager.instance
            .editPdfScanFilePath(pdfScan.id, croppedFile.path);
        getListScanTextDetail();
        homeController.getListPdfScan();
        croppedFilePath?.value = croppedFile.path;
      }
    }
  }

  void showJobDetailModal(
    BuildContext context,
    PdfScan pdfScan,
  ) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return JobDetailModal(
          pdfScan: pdfScan,
        );
      },
    );
  }

  void saveLocalImage(String imagePath) async {
    if (imagePath.isNotEmpty) {
      File imageFile = File(imagePath);
      Uint8List bytes = await imageFile.readAsBytes();

      final result = await ImageGallerySaver.saveImage(bytes);

      if (result != null &&
          result.containsKey('isSuccess') &&
          result['isSuccess'] == true) {
        CommonWidget.toast('Save gallery sussceccfully');
      }
    }
  }

  void editImage(BuildContext context, PdfScan pdfScan) async {
    Uint8List? imageData;

    File imageFile = File(pdfScan.filePath);
    if (imageFile.existsSync()) {
      List<int> imageBytes = await imageFile.readAsBytes();

      final editedImage = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => editorImage.ImageEditor(
            image: imageBytes,
          ),
        ),
      );
      if (editedImage != null) {
        imageData = editedImage;
        Directory tempDir = await Directory.systemTemp.createTemp();

        File tempFile = File('${tempDir.path}/temp_file');

        await tempFile.writeAsBytes(imageData!);

        String filePath = tempFile.path;
        await SharedPreferencesManager.instance
            .editPdfScanFilePath(pdfScan.id, filePath);
        croppedFilePath?.value = filePath;
        homeController.getListPdfScan();
      }
    }
  }

  void getRecognizedText(String id, String image) async {
    try {
      isLoading.value = true;

      final inputImage = InputImage.fromFilePath(image);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      ScanOCRListWithId scanOCRListWithId =
          ScanOCRListWithId(id: id, scanOCRList: []);
      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          ScanOCR scanOCR = ScanOCR(itemScanOrc: line.text);
          scanOCRListWithId.scanOCRList.add(scanOCR);
        }
      }
      listScanned.add(scanOCRListWithId);

      saveListScanned();
    } catch (e) {
      print('Error during text recognition: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void getListScanTextDetail() async {
    List<ScanOCRListWithId> result =
        await SharedPreferencesManager.instance.getScanOCRListWithIds();
    if (result.isNotEmpty) {
      listScanned.value = result;
    } else {
      listScanned.clear();
    }
  }

  void getListWaterMark() async {
    waterMarkList.value =
        await SharedPreferencesManager.instance.getWaterMarkListList();
  }

  void deleteWaterMarksById(String id) {
    SharedPreferencesManager.instance.deleteWaterMarkById(id);
    getListWaterMark();
    Get.back();
  }

  void saveListScanned() async {
    try {
      await SharedPreferencesManager.instance
          .saveScanOCRListWithId(listScanned);
    } catch (e) {
      print('Error saving listScanned to SharedPreferences: $e');
    }
  }

  void saveListWaterMark(
    BuildContext context,
    SaveItemWaterMark? saveItemWaterMark,
  ) async {
    waterMarkList.clear();
    waterMarkList.value =
        await SharedPreferencesManager.instance.getWaterMarkListList();
    if (saveItemWaterMark != null) {
      waterMarkList.add(saveItemWaterMark);
      SharedPreferencesManager.instance.saveWaterMarkList(waterMarkList);
      createWaterMarkController.clear();
      getListWaterMark();
      Get.back();
    }
  }
}
