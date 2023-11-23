import 'dart:async';
import 'package:flutter_getx_base/lang/language.dart';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:flutter_getx_base/shared/constants/common.dart';
import 'package:flutter_getx_base/shared/sharepreference.dart';
import 'package:flutter_getx_base/shared/widgets/common_widget.dart';
import 'package:get/get.dart';
import '../../../lang/translation_service.dart';

class HomeController extends GetxController {
  final RxBool isSearching = false.obs;
  final RxList<PdfScan> listPdfScan = <PdfScan>[].obs;
  final RxList<PdfScan> searchResults = <PdfScan>[].obs;
  final Rx<DateTime?> currentBackPressTime = Rx<DateTime?>(null);

  final Rx<Language> _selectedLanguage =
      Language(1, "🇺🇸", "English", "en").obs;
  Language get selectedLanguage => _selectedLanguage.value;

  @override
  void onInit() {
    super.onInit();
    getListPdfScan();
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
