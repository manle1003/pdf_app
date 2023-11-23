import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:flutter_getx_base/shared/widgets/custom_image_view.dart';
import 'package:intl/intl.dart';
import '../../../../shared/constants/colors.dart';

class PdfScanListTile extends StatelessWidget {
  final PdfScan pdfScan;

  const PdfScanListTile(this.pdfScan);

  @override
  Widget build(BuildContext context) {
    File imageFile = File(pdfScan.filePath);
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CustomImageView(
            file: imageFile,
            width: 50,
          )),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 3),
        child: Text(
          'PDF SCAN',
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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.more_vert),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.radio_button_unchecked,
            size: 16,
            color: ColorConstants.grey800,
          ),
        ],
      ),
    );
  }
}
