import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/save_item_mark_model.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model_by_id.dart';
import 'package:flutter_getx_base/shared/sharepreference.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../../models/save_item_scan_ocr_model.dart';

class ScanDetailDartController extends GetxController {
  RxList<ScanOCRListWithId> listScanned = <ScanOCRListWithId>[].obs;
  Rx<SaveItemWaterMark?> saveItemWaterMark = Rx<SaveItemWaterMark?>(null);
  RxList<SaveItemWaterMark> waterMarkList = <SaveItemWaterMark>[].obs;

  final TextEditingController createWaterMarkController =
      TextEditingController();
  final GlobalKey<FormState> createWaterMarkFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getListScanTextDetail();
    getListWaterMark();
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
