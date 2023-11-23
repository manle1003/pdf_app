// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../components/custom_item_in_home/custom_item_in_home.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return controller.onWillPop();
      },
      child: Scaffold(
        extendBody: true,
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 80),
          child: Obx(
            () => controller.listPdfScan != null &&
                    controller.listPdfScan.length != 0
                ? _buildListView(controller)
                : Center(child: Lottie.asset('assets/images/lt_no_data.json')),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(HomeController controller) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _getItemCount(controller),
      itemBuilder: (BuildContext context, int index) {
        return _buildAnimatedContainer(controller, index);
      },
    );
  }

  Widget _buildAnimatedContainer(HomeController controller, int index) {
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
      child: _buildListTile(controller, index),
    );
  }

  Widget _buildListTile(HomeController controller, int index) {
    final List<PdfScan> dataList = controller.isSearching.value
        ? controller.searchResults
        : controller.listPdfScan;

    return PdfScanListTile(dataList[index]);
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: [
        _buildSearchTextField(),
        _buildIconButton(Icons.add, () {}),
        _buildIconButton(Icons.more_vert, () {}),
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
      labelText: 'Search',
      hintText: 'Enter search',
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Function() onPressed) {
    return Expanded(
      flex: 1,
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }

  int _getItemCount(HomeController controller) {
    return controller.isSearching.value
        ? controller.searchResults.length
        : controller.listPdfScan.length;
  }
}
