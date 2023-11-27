// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:flutter_getx_base/theme/theme_helper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../lang/constants_common.dart';
import '../../../shared/constants/colors.dart';
import '../camera_screen/camera_screen.dart';
import '../components/custom_dialog/custom_dialog.dart';
import '../components/custom_item_in_home/custom_item_in_home.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return controller.onWillPop(context);
      },
      child: Scaffold(
        extendBody: true,
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 80),
          child: Obx(
            () => controller.listPdfScan != null &&
                    controller.listPdfScan.length != 0
                ? _buildListView(controller, context)
                : Center(child: Lottie.asset('assets/images/lt_no_data.json')),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(HomeController controller, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _getItemCount(controller),
      itemBuilder: (BuildContext context, int index) {
        return _buildAnimatedContainer(controller, index, context);
      },
    );
  }

  Widget _buildAnimatedContainer(
      HomeController controller, int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: _buildListTile(controller, index, context),
    );
  }

  Widget _buildListTile(
      HomeController controller, int index, BuildContext context) {
    final List<PdfScan> dataList = controller.isSearching.value
        ? controller.searchResults
        : controller.listPdfScan;
    final slidableKey = GlobalKey<SlidableState>();
    return Slidable(
        key: slidableKey,
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.red,
            ),
            child: IconButton(
              icon: Icon(
                Icons.delete,
                color: appTheme.whiteA700,
              ),
              onPressed: () {
                CustomDialog.showMaterialDialog1(context, () {
                  controller.deleteQRCodeById(dataList[index].id);
                  Get.back();
                });
                slidableKey.currentState?.close();
              },
            ),
          ),
        ],
        child: PdfScanListTile(dataList[index]));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        _buildSearchTextField(),
        _buildIconButton(Icons.add, () {}),
      ],
    );
  }

  Widget _buildSearchTextField() {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          decoration: _buildTextFieldDecoration(),
          onChanged: (value) {
            controller.isSearching.value = value.isNotEmpty;
            controller.filterListPdf(value);
          },
        ),
      ),
    );
  }

  InputDecoration _buildTextFieldDecoration() {
    return InputDecoration(
      contentPadding: getPadding(all: 10),
      isDense: false,
      labelText: ConstantsCommon.search.tr,
      hintText: ConstantsCommon.enterSearch.tr,
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Function() onPressed) {
    return PopupMenuButton<String>(
      offset: Offset(-20, 40),
      onSelected: (value) {
        print('Selected: $value');
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'option1',
            child: Row(
              children: [
                Icon(Icons.picture_as_pdf, color: Colors.blue),
                SizedBox(width: 8),
                Text('Image to PDF'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(),
              ),
            ),
            value: 'option1',
            child: Row(
              children: [
                Icon(Icons.create, color: Colors.green),
                SizedBox(width: 8),
                Text('Create scan'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            onTap: () {
              CustomDialog.showMaterialDialog2(context, () {
                controller.deletePdfAll();
                Get.back();
              });
            },
            value: 'option2',
            child: Row(
              children: [
                Icon(Icons.delete, color: Colors.red),
                SizedBox(width: 8),
                Text('Delete all'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            onTap: () => controller.showBottomSheet(context),
            value: 'option3',
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.orange),
                SizedBox(width: 8),
                Text('Quit'),
              ],
            ),
          ),
        ];
      },
    );
  }

  int _getItemCount(HomeController controller) {
    return controller.isSearching.value
        ? controller.searchResults.length
        : controller.listPdfScan.length;
  }
}
