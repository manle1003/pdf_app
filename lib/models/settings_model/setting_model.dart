import 'package:flutter/material.dart';
import 'package:flutter_getx_base/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../lang/constants_common.dart';

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
    title: ConstantsCommon.introduction.tr,
    subtext: ConstantsCommon.learnApp.tr,
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.DEFAULT_PDF_PAGE_SIZE),
    image: Icon(Icons.screenshot_monitor_outlined),
    title: ConstantsCommon.defaultPdfSize.tr,
    subtext: '210mm x 297mm',
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.SIGNATURE),
    image: Icon(Icons.description_outlined),
    title: ConstantsCommon.signature.tr,
    subtext: ConstantsCommon.scanHandwritten.tr,
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.FONT_FAMILY),
    image: Icon(Icons.format_size_outlined),
    title: ConstantsCommon.fontFamily.tr,
    subtext: ConstantsCommon.chooseFontStyle.tr,
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.APP_LANGUAGE),
    image: Icon(Icons.language_outlined),
    title: ConstantsCommon.appLanguage.tr,
    subtext: ConstantsCommon.chooseLanguage.tr,
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.FEED_BACK),
    image: Icon(Icons.feedback_outlined),
    title: ConstantsCommon.feedback.tr,
    subtext: ConstantsCommon.giveFeedback.tr,
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.RATING),
    image: Icon(Icons.star_border_outlined),
    title: ConstantsCommon.rating.tr,
    subtext: ConstantsCommon.appReviews.tr,
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () {},
    image: Icon(Icons.share_outlined),
    title: ConstantsCommon.share.tr,
    subtext: ConstantsCommon.shareToEvery.tr,
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
  SettingsItemsModel(
    function: () => Get.toNamed(Routes.ABOUT_US),
    image: Icon(Icons.help_outline),
    title: ConstantsCommon.aboutUs.tr,
    subtext: ConstantsCommon.learnMoreUs.tr,
    iconButton: Icon(Icons.keyboard_arrow_right),
    isCheckDisplayIcon: true,
  ),
];
