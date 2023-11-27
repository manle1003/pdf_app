import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_controller.dart';
import 'package:flutter_getx_base/routes/app_pages.dart';
import 'package:flutter_getx_base/shared/widgets/custom_image_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../custom_dialog/custom_dialog.dart';

class PdfScanListTile extends StatelessWidget {
  final PdfScan pdfScan;

  PdfScanListTile(this.pdfScan);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    File imageFile = File(pdfScan.filePath);
    return ListTile(
      onTap: () => Get.toNamed(
        Routes.SCAN_DETAIL,
        arguments: pdfScan,
      ),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CustomImageView(
            file: imageFile,
            width: 50,
          )),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 3),
        child: Text(
          pdfScan.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
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
                  DateFormat('hh:mm a').format(pdfScan.dateTime),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  DateFormat.yMMMEd().format(pdfScan.dateTime),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          CustomDialog.showMaterialDialogBottomSheetItem(
            context: context,
            pdfScan: pdfScan,
          );
        },
        icon: Icon(
          Icons.more_vert,
        ),
      ),
    );
  }
}
