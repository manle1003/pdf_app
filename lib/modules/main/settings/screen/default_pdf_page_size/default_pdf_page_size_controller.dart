import 'package:flutter_getx_base/modules/main/settings/screen/default_pdf_page_size/model/pdf_size_model.dart';
import 'package:get/get.dart';

class DefaultPdfPageSizeController extends GetxController {
  RxMap<String, String> selectedOption = pdfSizeData[0].obs;

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
}
