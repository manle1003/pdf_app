import 'package:get/get.dart';
import './wifi_transfer_controller.dart';

class WifiTransferBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(WifiTransferController());
    }
}