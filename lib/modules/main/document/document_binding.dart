import 'package:flutter_getx_base/modules/main/document/document_controller.dart';
import 'package:get/get.dart';

class DocumentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentController>(() => DocumentController());
  }
}
