import 'package:get/get.dart';

import 'app_lock_controller.dart';

class AppLockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppLockController>(
      () => AppLockController(),
    );
  }
}
