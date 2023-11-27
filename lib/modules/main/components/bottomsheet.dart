// ignore_for_file: unnecessary_statements
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_controller.dart';
import 'package:flutter_getx_base/modules/main/scan_detail_dart/scan_detail_dart_controller.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:get/get.dart';

import '../../../models/save_item_pdf_scan_model.dart';
import 'custom_job_detail.dart';

class JobDetailModal extends StatelessWidget {
  final PdfScan? pdfScan;
  JobDetailModal({
    Key? key,
    required this.pdfScan,
  }) : super(key: key);

  final HomeController homeController = Get.find();
  final ScanDetailDartController scanDetailDartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: 70,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 204, 202, 202),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              homeController.sendEmailWithAttachment(
                pdfScan?.title ?? 'Pdf Scan',
                pdfScan?.title ?? 'Pdf Scan',
                '',
                [pdfScan?.filePath ?? ''],
              );
            },
            child: CustomJobDetail(
              textTitle: 'Email to...',
              textDescription: '',
              iconData: Icons.email,
              colorIcon: ColorConstants.orangerRewardColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              scanDetailDartController.saveLocalImage(pdfScan?.filePath ?? '');
            },
            child: CustomJobDetail(
              textTitle: 'Export to gallery',
              textDescription: '',
              iconData: Icons.downloading,
              colorIcon: Colors.blueAccent,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: CustomJobDetail(
              textTitle: 'Rename',
              textDescription: '',
              iconData: Icons.edit_document,
              colorIcon: Color.fromARGB(255, 89, 128, 5),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: CustomJobDetail(
              textTitle: 'Water Mark'.tr,
              textDescription: 'Send message'.tr,
              iconData: Icons.water_damage,
              colorIcon: Colors.blue,
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
