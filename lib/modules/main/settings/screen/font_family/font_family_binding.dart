import 'package:get/get.dart';

import 'font_family_controller.dart';

class FontFamilyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FontFamilyController>(
      () => FontFamilyController(),
    );
  }
}
