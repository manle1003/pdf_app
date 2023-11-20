import 'package:flutter_getx_base/modules/main/document/document_controller.dart';
import 'package:get/get.dart';

import 'api/api_provider.dart';
import 'api/api_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(Get.find()), permanent: true);
    Get.put(ApiRepository(), permanent: true);
    Get.put(DocumentController());
  }
}
