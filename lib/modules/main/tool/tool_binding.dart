import 'package:get/get.dart';

import 'tool_controller.dart';

class ToolBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToolController>(() => ToolController());
  }
}
