import 'package:get/get.dart';

import 'scan_detail_dart_controller.dart';

class ScanDetailDartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanDetailDartController>(
      () => ScanDetailDartController(),
    );
  }
}
