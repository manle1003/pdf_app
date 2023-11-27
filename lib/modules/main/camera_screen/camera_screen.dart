import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_controller.dart';
import 'package:flutter_getx_base/routes/app_pages.dart';
import 'package:flutter_getx_base/shared/sharepreference.dart';
import 'package:flutter_getx_base/shared/utils/rive_utils.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  HomeController homeController = Get.find();
  Future<String> _photoPathBuilder() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<String> _videoPathBuilder() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4';
  }

  Uint8List? imageData;
  Rx<PdfScan?> pdfScan = Rx<PdfScan?>(null);
  List<PdfScan> filePathList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CameraAwesomeBuilder.awesome(
              saveConfig: SaveConfig.photoAndVideo(
                initialCaptureMode: CaptureMode.photo,
                photoPathBuilder: _photoPathBuilder,
                videoPathBuilder: _videoPathBuilder,
              ),
              filter: AwesomeFilter.None,
              previewFit: CameraPreviewFit.fitWidth,
              onMediaTap: (mediaCapture) async {
                File imageFile = File(mediaCapture.filePath);
                if (imageFile.existsSync()) {
                  List<int> imageBytes = await imageFile.readAsBytes();
                  setState(() => imageData = Uint8List.fromList(imageBytes));

                  final editedImage = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageEditor(
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
                    var uuid = Uuid();

                    filePathList = await SharedPreferencesManager.instance
                        .getPdfScanList();
                    pdfScan.value = PdfScan(
                      id: uuid.v4(),
                      title: 'PDF Scan',
                      filePath: filePath,
                      dateTime: DateTime.now(),
                    );
                    saveSharePreferencesPdfScan(pdfScan.value);
                    print('filePathList: $filePathList');
                    setState(() {});
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void saveSharePreferencesPdfScan(PdfScan? pdfScan) async {
    filePathList.clear();
    filePathList = await SharedPreferencesManager.instance.getPdfScanList();
    if (pdfScan != null) {
      filePathList.add(pdfScan);
      RiveUtils.showSuccessDialog('Save successfully', context, () {
        Get.offAllNamed(Routes.ENTRY_POINT);
      });
      SharedPreferencesManager.instance.savePdfScanList(filePathList);
      homeController.getListPdfScan();
    }
  }
}
