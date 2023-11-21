import 'package:get/get.dart';

import 'default_pdf_page_size_controller.dart';

class DefaultPdfPageSizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DefaultPdfPageSizeController>(
      () => DefaultPdfPageSizeController(),
    );
  }
}
