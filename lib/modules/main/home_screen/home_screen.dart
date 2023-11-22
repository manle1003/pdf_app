// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.bottomNavIndex.value != 0) {
          controller.setValueBottomIndex(0);
          return false;
        }
        return controller.onWillPop();
      },
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          actions: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: getPadding(all: 10),
                    isDense: false,
                    labelText: 'Search',
                    hintText: 'Enter search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    controller.isCheckSearch.value = value.isNotEmpty;
                    controller.filterListPdf(value);
                  },
                ),
              ),
            ),
            _buildIconButton(Icons.add, () {}),
            _buildIconButton(Icons.more_vert, () {}),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 80),
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: _getItemCount(controller),
              itemBuilder: (BuildContext context, int index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0.4),
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
              },
            ),
          ),
        ),
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

  Widget _buildListTile(HomeController controller, int index) {
    final List<String> dataList = controller.isCheckSearch.value
        ? controller.searchResults
        : controller.pdfList;

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_640.jpg',
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 3),
        child: Text(
          dataList[index],
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
                  DateFormat('hh:mm a').format(DateTime.now()),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  DateFormat.yMMMEd().format(DateTime.now()),
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

  int _getItemCount(HomeController controller) {
    return controller.isCheckSearch.value
        ? controller.searchResults.length
        : controller.pdfList.length;
  }
}
