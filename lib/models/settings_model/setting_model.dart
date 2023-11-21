import 'package:flutter/material.dart';
import 'package:flutter_getx_base/routes/app_pages.dart';
import 'package:get/get.dart';

class SettingsItemsModel {
  final Widget image;
  final String title, subtext;
  final Widget iconButton;
  final bool isCheckDisplayIcon;
  final Function()? function;

  SettingsItemsModel({
    required this.image,
    required this.title,
    required this.subtext,
    required this.iconButton,
    required this.isCheckDisplayIcon,
    this.function,
  });
}

List<SettingsItemsModel> settingsItems = [
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.INTRODUCTION),
    image: Icon(Icons.receipt_long_outlined),
    title: 'Introduction',
    subtext: 'Learn about app in 1 minute',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.CLOUD_STORAGE),
    image: Icon(Icons.cloud_outlined),
    title: 'Cloud storage',
    subtext: '15G free spaces',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.APP_LOCK),
    image: Icon(
      Icons.lock_outline,
    ),
    title: 'App lock',
    subtext: 'Keep safe and private',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.WIFI_TRANSFER),
    image: Icon(Icons.transform_outlined),
    title: 'Wifi transfer',
    subtext: 'Transfer files to and from PC',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.DEFAULT_PDF_PAGE_SIZE),
    image: Icon(Icons.screenshot_monitor_outlined),
    title: 'Default PDF page size',
    subtext: '210mm x 297mm',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.SIGNATURE),
    image: Icon(Icons.description_outlined),
    title: 'Signature',
    subtext: 'Scan handwritten signature here',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.FONT_FAMILY),
    image: Icon(Icons.format_size_outlined),
    title: 'Font family',
    subtext: 'Set font style',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.APP_LANGUAGE),
    image: Icon(Icons.language_outlined),
    title: 'App language',
    subtext: 'Choose language',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.FEED_BACK),
    image: Icon(Icons.feedback_outlined),
    title: 'Feed back',
    subtext: 'Give us your feedback',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.RATING),
    image: Icon(Icons.star_border_outlined),
    title: 'Rating',
    subtext: 'App reviews',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () {},
    image: Icon(Icons.share_outlined),
    title: 'Share',
    subtext: 'Share to everyone',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.ABOUT_US),
    image: Icon(Icons.help_outline),
    title: 'About us',
    subtext: 'Learn more about us',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
];
