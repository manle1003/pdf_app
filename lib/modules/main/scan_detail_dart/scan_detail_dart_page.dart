import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_base/models/save_item_mark_model.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:flutter_getx_base/modules/main/components/custom_dialog/custom_dialog.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/introduction/components/default_button.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../app_controller.dart';
import '../../../models/save_item_pdf_scan_model_by_id.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/widgets/common_widget.dart';
import '../../../shared/widgets/custom_image_view.dart';
import '../../../shared/widgets/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import 'scan_detail_dart_controller.dart';

class ScanDetailDartPage extends GetView<ScanDetailDartController> {
  ScanDetailDartPage({super.key});

  final AppController appController = Get.find();

  PrimaryColors get appTheme => ThemeHelper().themeColor();
  final PdfScan pdfScan = Get.arguments;

  @override
  Widget build(BuildContext context) {
    File imageFile = File(pdfScan.filePath);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: appController.isDarkModeOn.value
            ? ColorConstants.grey800
            : ColorConstants.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            pdfScan.title,
            style: CustomTextStyles.labelBlack500Size18Fw600,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TabBar(
                isScrollable: false,
                labelColor: appController.isDarkModeOn.value
                    ? ColorConstants.colorDarkModeBlue
                    : ColorConstants.backgroundColorButtonGreen,
                unselectedLabelColor: appController.isDarkModeOn.value
                    ? appTheme.whiteA700.withOpacity(.8)
                    : appTheme.gray600,
                indicatorColor: appController.isDarkModeOn.value
                    ? ColorConstants.colorDarkModeBlue
                    : ColorConstants.backgroundColorButtonGreen,
                labelStyle: const TextStyle(fontSize: 14),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  FittedBox(fit: BoxFit.none, child: Tab(text: 'Image')),
                  FittedBox(fit: BoxFit.none, child: Tab(text: 'Scan Text')),
                  FittedBox(fit: BoxFit.none, child: Tab(text: 'Mark')),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildContentTab1(
                    context,
                    imageFile,
                  ),
                  Center(
                    child: buildContentTab2(
                      context,
                    ),
                  ),
                  buildContentTab3(
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildIconButtonColumn(
              onPressed: () {},
              icon: Icons.crop,
              iconColor: ColorConstants.black,
              label: '',
            ),
            buildIconButtonColumn(
              onPressed: () async {},
              icon: Icons.edit,
              iconColor: ColorConstants.greenLightRewardColor,
              label: '',
            ),
            buildIconButtonColumn(
              onPressed: () {},
              icon: Icons.share,
              iconColor: ColorConstants.nearlyBlue,
              label: '',
            ),
            buildIconButtonColumn(
              onPressed: () {},
              icon: Icons.filter,
              iconColor: ColorConstants.lightBlueRewardColor,
              label: '',
            ),
            buildIconButtonColumn(
              onPressed: () {},
              icon: Icons.more_vert,
              iconColor: ColorConstants.blackColor,
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContentTab1(BuildContext context, File imageFile) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: ColorConstants.white,
            width: double.infinity,
            child: ListTile(
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
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CustomImageView(
              file: imageFile,
              height: getSize(400),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContentTab2(BuildContext context) {
    return Obx(
      () {
        String id = pdfScan.id;

        List<ScanOCRListWithId> filteredList = controller.listScanned
            .where((scanList) => scanList.id == id)
            .toList();

        return controller.isLoading.value
            ? Center(
                child:
                    Lottie.asset('assets/images/lt_loading.json', height: 120),
              )
            : filteredList.length != 0
                ? ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: filteredList[index]
                              .scanOCRList
                              .map(
                                (scanOCR) => Padding(
                                  padding: getPadding(all: 6),
                                  child: Container(
                                    padding:
                                        getPadding(left: 8, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                      color: appTheme.gray300,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(scanOCR.itemScanOrc),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                text: scanOCR.itemScanOrc,
                                              ),
                                            );
                                            CommonWidget.toast(
                                                'Copy successfully!');
                                          },
                                          icon: Icon(
                                            Icons.copy,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Lottie.asset('assets/images/lt_orc_text.json'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Extract text from scans and quickly search scans also',
                          style: CustomTextStyles.labelGray600Size16Fw500,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DefaultButton(
                        text: 'Scan Text',
                        press: () {
                          controller.getRecognizedText(
                            pdfScan.id,
                            pdfScan.filePath,
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
      },
    );
  }

  Widget buildContentTab3(BuildContext context) {
    return Obx(
      () {
        String id = pdfScan.id;
        List<SaveItemWaterMark> filteredList = controller.waterMarkList
            .where((scanList) => scanList.id == id)
            .toList();
        controller.getListWaterMark();
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: filteredList.length != 0
                ? ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(flex: 1, child: stepProgressIndicator()),
                              Expanded(
                                flex: 9,
                                child: ListTile(
                                  tileColor: appTheme.gray300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  title: Text(filteredList[index].title),
                                  subtitle: Text(
                                    DateFormat('hh:mm a').format(
                                      filteredList[index].dateTime,
                                    ),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      CustomDialog.showMaterialDialog1(context,
                                          () {
                                        controller.deleteWaterMarksById(
                                            filteredList[index].id);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: ColorConstants.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  )
                : Center(
                    child: Lottie.asset(
                      'assets/images/lt_no_data.json',
                      height: 200,
                    ),
                  ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: FloatingActionButton(
              backgroundColor: ColorConstants.backgroundColorButtonGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () {
                CustomDialog.showMaterialDialog3(
                  context,
                  pdfScan,
                );
              },
              child: Icon(
                Icons.add,
                color: ColorConstants.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget stepProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          StepProgressIndicator(
            totalSteps: 10,
            crossAxisAlignment: CrossAxisAlignment.end,
            direction: Axis.vertical,
            size: 2.5,
          ),
          circularDot(),
        ],
      ),
    );
  }

  Widget circularDot() {
    return Container(
      width: 16.0,
      height: 16.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorConstants.backgroundColorButtonGreen,
      ),
    );
  }

  Widget buildIconButtonColumn({
    required Function() onPressed,
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
          Text(
            label,
            style: CustomTextStyles.labelGray400Size14Fw400,
          ),
        ],
      ),
    );
  }
}
