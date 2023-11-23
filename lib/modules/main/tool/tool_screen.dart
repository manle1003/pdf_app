// tool_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/lang/constants_common.dart';
import 'package:flutter_getx_base/modules/main/tool/tool_controller.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:flutter_getx_base/shared/widgets/custom_text_style.dart';
import 'package:get/get.dart';

class ToolScreen extends GetView<ToolController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ConstantsCommon.pdfTools.tr,
            style: CustomTextStyles.labelBlack500Size18Fw700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                ConstantsCommon.convertPdf.tr,
                style: CustomTextStyles.labelBlack500Size24Fw600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTool(
                  'assets/icons/ic_image.png',
                  ConstantsCommon.images.tr,
                ),
                buildTool(
                  'assets/icons/ic_pdf.png',
                  ConstantsCommon.imageToPdf.tr,
                ),
                buildTool(
                  'assets/icons/ic_image_long.png',
                  ConstantsCommon.longImage.tr,
                ),
                buildTool(
                  'assets/icons/ic_wide.png',
                  ConstantsCommon.wideImage.tr,
                ),
              ],
            ),
            SizedBox(
              height: getSize(40),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                ConstantsCommon.editPdf.tr,
                style: CustomTextStyles.labelBlack500Size24Fw600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTool(
                  'assets/icons/ic_signture.png',
                  ConstantsCommon.signature.tr,
                ),
                buildTool(
                  'assets/icons/ic_water_mark.png',
                  ConstantsCommon.waterMark.tr,
                ),
                buildTool(
                  'assets/icons/ic_password_file.png',
                  ConstantsCommon.password.tr,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Explore a variety of tools to manipulate and enhance your PDF files.',
              style: CustomTextStyles.labelGray600Size14Fw400,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTool(String imagePath, String label) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 26,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: CustomTextStyles.labelGray600Size14Fw400,
        ),
      ],
    );
  }
}
