import 'dart:convert';
import 'package:flutter_getx_base/models/save_item_pdf_scan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferencesManager._privateConstructor();

  static final SharedPreferencesManager instance =
      SharedPreferencesManager._privateConstructor();

  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<void> clear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> savePdfScanList(List<PdfScan> pdfScan) async {
    final prefs = await SharedPreferences.getInstance();
    final pdfScanJson = pdfScan.map((pdfScan) => pdfScan.toJson()).toList();
    await prefs.setString('pdfScanList', json.encode(pdfScanJson));
  }

  Future<List<PdfScan>> getPdfScanList() async {
    final prefs = await SharedPreferences.getInstance();
    final pdfScansJson = prefs.getString('pdfScanList');

    if (pdfScansJson != null) {
      final List<dynamic> decoded = json.decode(pdfScansJson);
      return decoded.map((json) => PdfScan.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<void> deletePdfScanById(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final pdfScanJson = prefs.getString('pdfScanList');

    if (pdfScanJson != null) {
      final List<dynamic> decoded = json.decode(pdfScanJson);
      List<PdfScan> pdfScan =
          decoded.map((json) => PdfScan.fromJson(json)).toList();

      final index = pdfScan.indexWhere((qrCode) => qrCode.id == id);

      if (index != -1) {
        pdfScan.removeAt(index);

        final updatedQRCodeList =
            pdfScan.map((qrCode) => qrCode.toJson()).toList();
        await prefs.setString('pdfScanList', json.encode(updatedQRCodeList));
      }
    }
  }

  Future<void> deletePdfScanAll() async {
    final prefs = await SharedPreferences.getInstance();
    final pdfScanJson = prefs.getString('pdfScanList');

    if (pdfScanJson != null) {
      final List<dynamic> decoded = json.decode(pdfScanJson);
      List<PdfScan> pdfScan =
          decoded.map((json) => PdfScan.fromJson(json)).toList();

      pdfScan.clear();

      final updatedPdfScanList =
          pdfScan.map((pdsScan) => pdsScan.toJson()).toList();
      await prefs.setString('pdfScanList', json.encode(updatedPdfScanList));
    }
  }

  Future<void> updateTitleForPdf(String id, String newTitle) async {
    final prefs = await SharedPreferences.getInstance();
    final pdfScanJson = prefs.getString('pdfScanList');

    if (pdfScanJson != null) {
      final List<dynamic> decoded = json.decode(pdfScanJson);
      final List<PdfScan> pdfScan =
          decoded.map((json) => PdfScan.fromJson(json)).toList();

      final index = pdfScan.indexWhere((pdf) => pdf.id == id);

      if (index != -1) {
        pdfScan[index].title = newTitle;

        final updatedPdfScanList =
            pdfScan.map((pdfScanList) => pdfScanList.toJson()).toList();
        await prefs.setString('pdfScanList', json.encode(updatedPdfScanList));
      }
    }
  }

  Future<void> editPdfScanFilePath(String id, String newFilePath) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pdfScansJson = prefs.getString('pdfScanList');

      if (pdfScansJson != null) {
        List<dynamic> decoded = json.decode(pdfScansJson);
        List<PdfScan> pdfScanList =
            decoded.map((json) => PdfScan.fromJson(json)).toList();

        int index = pdfScanList.indexWhere((pdf) => pdf.id == id);

        if (index != -1) {
          pdfScanList[index].filePath = newFilePath;

          final updatedPdfScanList =
              pdfScanList.map((pdfScan) => pdfScan.toJson()).toList();
          await prefs.setString('pdfScanList', json.encode(updatedPdfScanList));
        }
      }
    } catch (e) {
      print('Error in editPdfScanFilePath: $e');
    }
  }

  Future<int> getIndexChangeLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt('indexChangeLanguage') ?? 0;

    return index;
  }

  Future<void> setLocalTitleChangeLanguage(String localTitle) async {
    final prefs = await SharedPreferences.getInstance();
    final localTitleChange = localTitle;
    await prefs.setString('localTitle', localTitleChange);
  }

  Future<String> getLocalTitleChangeLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String localTitle = prefs.getString('localTitle') ?? 'English';

    return localTitle;
  }

  Future<void> setIndexChangeLanguage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final indexChangeLanguage = index;
    await prefs.setInt('indexChangeLanguage', indexChangeLanguage);
  }
}
