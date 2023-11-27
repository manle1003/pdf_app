// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/save_item_mark_model.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_controller.dart';
import 'package:flutter_getx_base/modules/main/scan_detail_dart/scan_detail_dart_controller.dart';
import 'package:flutter_getx_base/routes/routes.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:flutter_getx_base/shared/sharepreference.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:flutter_getx_base/shared/widgets/custom_image_view.dart';
import 'package:flutter_getx_base/shared/widgets/input_field.dart';
import 'package:flutter_getx_base/theme/theme_helper.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../models/save_item_pdf_scan_model.dart';
import '../../../../shared/utils/show_dialog_add_group.dart';
import '../../../../shared/widgets/custom_text_style.dart';

class CustomDialog {
  static HomeController homeController = Get.find();
  static ScanDetailDartController scanDetailDartController = Get.find();

  static void showMaterialDialog1(
    BuildContext context,
    Function() onPressDelete,
  ) {
    Dialogs.materialDialog(
      msg: 'Are you sure ? you can\'t undo this',
      title: "Delete",
      color: Colors.white,
      context: context,
      dialogWidth: kIsWeb ? 0.3 : null,
      onClose: (value) => print("returned value is '$value'"),
      actions: [
        IconsOutlineButton(
          onPressed: () {
            Navigator.of(context).pop(['Test', 'List']);
          },
          text: 'Cancel',
          iconData: Icons.cancel_outlined,
          textStyle: TextStyle(color: Colors.grey),
          iconColor: Colors.grey,
        ),
        IconsButton(
          onPressed: onPressDelete,
          text: "Delete",
          iconData: Icons.delete,
          color: Colors.red,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  static void showMaterialDialog2(
    BuildContext context,
    Function() onPressDelete,
  ) {
    Dialogs.bottomMaterialDialog(
      msg: 'Are you sure? Do you want delete all',
      title: 'Delete',
      context: context,
      actions: [
        IconsOutlineButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Cancel',
          iconData: Icons.cancel_outlined,
          textStyle: TextStyle(color: Colors.grey),
          iconColor: Colors.grey,
        ),
        IconsButton(
          onPressed: onPressDelete,
          text: 'Delete',
          iconData: Icons.delete,
          color: Colors.red,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  static void showMaterialDialogBottomSheetItem({
    required BuildContext context,
    PdfScan? pdfScan,
  }) {
    Dialogs.bottomMaterialDialog(
      context: context,
      customView: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CustomImageView(
                file: File(pdfScan?.filePath ?? ''),
                width: 50,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 3),
              child: Text(
                pdfScan?.title ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            trailing: buildIconButtonColumn(
              onPressed: () {
                CustomDialog.showMaterialDialog1(context, () {
                  homeController.deleteQRCodeById(pdfScan?.id ?? '');
                });
              },
              icon: Icons.delete,
              iconColor: ColorConstants.red,
              label: 'Delete',
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('hh:mm a').format(
                          pdfScan?.dateTime ?? DateTime.now(),
                        ),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(
                          pdfScan?.dateTime ?? DateTime.now(),
                        ),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Divider(
              height: 1,
              color: appTheme.gray300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIconButtonColumn(
                onPressed: () {},
                icon: Icons.picture_as_pdf,
                iconColor: ColorConstants.lightBlueColor,
                label: 'PDF',
              ),
              buildIconButtonColumn(
                onPressed: () async {
                  if (File(pdfScan?.filePath ?? '').existsSync()) {
                    await Share.shareFiles([pdfScan?.filePath ?? ""],
                        text: 'Check out this image!');
                  }
                  Get.back();
                },
                icon: Icons.share,
                iconColor: ColorConstants.nearlyBlue,
                label: 'Share',
              ),
              buildIconButtonColumn(
                onPressed: () {
                  Get.toNamed(Routes.SCAN_DETAIL, arguments: {
                    'pdfScan': pdfScan,
                    'isCheckTab': true,
                  });
                },
                icon: Icons.document_scanner,
                iconColor: ColorConstants.orangeColor,
                label: 'Extract Text',
              ),
              buildIconButtonColumn(
                onPressed: () async {
                  Uint8List? imageData;

                  File imageFile = File(pdfScan?.filePath ?? '');
                  if (imageFile.existsSync()) {
                    List<int> imageBytes = await imageFile.readAsBytes();

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
                      Directory tempDir =
                          await Directory.systemTemp.createTemp();

                      File tempFile = File('${tempDir.path}/temp_file');

                      await tempFile.writeAsBytes(imageData!);

                      String filePath = tempFile.path;
                      await SharedPreferencesManager.instance
                          .editPdfScanFilePath(pdfScan?.id ?? '', filePath);
                      homeController.getListPdfScan();
                      Get.back();
                    }
                  }
                },
                icon: Icons.edit,
                iconColor: ColorConstants.greenLightRewardColor,
                label: 'Edit',
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIconButtonColumn(
                onPressed: () {},
                icon: Icons.water_damage,
                iconColor: ColorConstants.colorDarkModeBlue,
                label: 'Watermark',
              ),
              buildIconButtonColumn(
                onPressed: () {
                  Get.dialog(
                    ShowDialogAddGroup(
                      formKey: homeController.changeTitlePdfScanFormKey,
                      pressOK: () {
                        homeController.changeTitle(
                          pdfScan?.id ?? '',
                          homeController.changeTitlePdfScanFormKey,
                          homeController.changeTitlePdfScanController.text,
                        );
                      },
                      textEditingController:
                          homeController.changeTitlePdfScanController,
                    ),
                  );
                },
                icon: Icons.edit_document,
                iconColor: ColorConstants.yellowRewardColor,
                label: 'Rename',
              ),
              buildIconButtonColumn(
                onPressed: () {},
                icon: Icons.lock,
                iconColor: ColorConstants.black,
                label: 'Lock',
              ),
              buildIconButtonColumn(
                onPressed: () {
                  homeController.sendEmailWithAttachment(
                    pdfScan?.title ?? 'Pdf Scan',
                    pdfScan?.title ?? 'Pdf Scan',
                    pdfScan?.filePath ?? '',
                    [pdfScan?.filePath ?? ''],
                  );
                },
                icon: Icons.email,
                iconColor: ColorConstants.colorDarkModeBlue,
                label: 'Email',
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildIconButtonColumn({
    required Function() onPressed,
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: CustomTextStyles.labelGray400Size14Fw400,
          ),
        ],
      ),
    );
  }

  static void showMaterialDialog3(BuildContext context, PdfScan pdfScan) {
    Dialogs.materialDialog(
      color: Colors.white,
      customView: Padding(
        padding: getPadding(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Text(
              'Create Water Mark',
              style: CustomTextStyles.labelGray600Size16Fw500,
            ),
            SizedBox(
              height: 16,
            ),
            Form(
              key: scanDetailDartController.createWaterMarkFormKey,
              child: InputField(
                hintText: 'Enter warter mark',
                controller: scanDetailDartController.createWaterMarkController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Water mark is required';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            if (scanDetailDartController.createWaterMarkFormKey.currentState!
                .validate()) {
              final saveItemWaterMark = SaveItemWaterMark(
                id: pdfScan.id,
                dateTime: DateTime.now(),
                title: scanDetailDartController.createWaterMarkController.text,
              );
              scanDetailDartController.saveListWaterMark(
                context,
                saveItemWaterMark,
              );
            }
          },
          text: 'Claim',
          iconData: Icons.done,
          color: Colors.blue,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  static void showMaterialDialog4(BuildContext context) {
    Dialogs.bottomMaterialDialog(
      color: Colors.white,
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Claim',
          iconData: Icons.done,
          color: Colors.blue,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
