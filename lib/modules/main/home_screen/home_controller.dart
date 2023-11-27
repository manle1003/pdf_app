import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/lang/language.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:flutter_getx_base/shared/constants/common.dart';
import 'package:flutter_getx_base/shared/sharepreference.dart';
import 'package:flutter_getx_base/shared/widgets/common_widget.dart';
import 'package:get/get.dart';
import '../../../lang/translation_service.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class HomeController extends GetxController {
  final RxBool isSearching = false.obs;
  final RxList<PdfScan> listPdfScan = <PdfScan>[].obs;
  final RxList<PdfScan> searchResults = <PdfScan>[].obs;
  final Rx<DateTime?> currentBackPressTime = Rx<DateTime?>(null);
  Rx<PdfScan?> selectedOption = Rx<PdfScan?>(null);
  RxString titleChange = "".obs;

  final TextEditingController changeTitlePdfScanController =
      TextEditingController();

  final GlobalKey<FormState> changeTitlePdfScanFormKey = GlobalKey<FormState>();

  final Rx<Language> _selectedLanguage =
      Language(1, "🇺🇸", "English", "en").obs;
  Language get selectedLanguage => _selectedLanguage.value;

  @override
  void onInit() {
    super.onInit();
    getListPdfScan();
  }

  bool isSelected(PdfScan pdfScan) {
    return selectedOption.value == pdfScan;
  }

  Future<void> sendEmailWithAttachment(String recipient, String subject,
      String body, List<String> attachmentPaths) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipient],
      attachmentPaths: attachmentPaths,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      print('Error sending email: $error');
    }
  }

  void toggleSelection(PdfScan pdfScan) {
    if (isSelected(pdfScan)) {
      selectedOption.value = null; // Deselect
    } else {
      selectedOption.value = pdfScan; // Select
    }
  }

  void getListPdfScan() async {
    try {
      final pdfScanList =
          await SharedPreferencesManager.instance.getPdfScanList();
      listPdfScan.value = pdfScanList;
    } catch (e) {
      print('Error loading PdfScan list: $e');
    }
  }

  void filterListPdf(String keyword) {
    if (keyword.isEmpty) {
      searchResults.value = listPdfScan;
    } else {
      searchResults.value = listPdfScan
          .where(
            (pdfList) => pdfList.title.toLowerCase().contains(
                  keyword.toLowerCase(),
                ),
          )
          .toList();
    }
  }

  void deletePdfAll() {
    SharedPreferencesManager.instance.deletePdfScanAll();
    getListPdfScan();
  }

  void deleteQRCodeById(String id) {
    SharedPreferencesManager.instance.deletePdfScanById(id);
    getListPdfScan();
    Get.back();
    Get.back();
  }

  Future<bool> onWillPop() async {
    final now = DateTime.now();
    if (currentBackPressTime.value == null ||
        now.difference(currentBackPressTime.value ?? DateTime.now()) >
            const Duration(seconds: 2)) {
      currentBackPressTime.value = now;
      CommonWidget.toast(CommonConstants.tittleExitApp.tr);
      return false;
    }
    return true;
  }

  void changeTitle(
      String id, GlobalKey<FormState> changeTitleFormKey, String title) async {
    if (changeTitleFormKey.currentState!.validate()) {
      await SharedPreferencesManager.instance
          .updateTitleForPdf(id, title.trim());
      titleChange.value = title.trim();
      getListPdfScan();
      changeTitlePdfScanController.clear();
      Get.back();
      Get.back();
    }
  }

  void handleLanguageSelection(Language? language) {
    if (language != null) {
      _selectedLanguage.value = language;
      final code = language.code;

      if (code == 'vi') {
        TranslationService.changeLocale('vi');
      } else if (code == 'en') {
        TranslationService.changeLocale('en');
      } else if (code == 'ko') {
        TranslationService.changeLocale('ko');
      }
      print("Bạn đã chọn: ${language.name}");
    }
  }

  @override
  void onClose() {
    // Dispose of resources here if needed
    super.onClose();
  }
}
