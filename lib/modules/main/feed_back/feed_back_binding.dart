import 'package:get/get.dart';

import 'feed_back_controller.dart';

class FeedBackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedBackController>(
      () => FeedBackController(),
    );
  }
}
