import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
    this.titleBottomNavigation,
  });

  String imagePath;
  String? titleBottomNavigation;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/icons/ic_home.svg',
      selectedImagePath: 'assets/icons/ic_home_bold.svg',
      titleBottomNavigation: 'Home'.tr,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/ic_new_card.svg',
      selectedImagePath: 'assets/icons/ic_new_card_bold.svg',
      titleBottomNavigation: 'New'.tr,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/ic_group.svg',
      selectedImagePath: 'assets/icons/ic_group_bold.svg',
      titleBottomNavigation: 'Group'.tr,
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/icons/ic_setting.svg',
      selectedImagePath: 'assets/icons/ic_setting_bold.svg',
      titleBottomNavigation: 'setting'.tr,
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
