import 'package:flutter/material.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/introduction/model/introduction_model.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  RxInt currentPage = 1.obs;
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onPageChanged(int value) {
    currentPage.value = value + 1;
  }

  void onNextButtonClick() {
    if (currentPage < introductionData.length) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {}
  }
}
