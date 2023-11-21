import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './wifi_transfer_controller.dart';

class WifiTransferScreen extends GetView<WifiTransferController> {
    
    const WifiTransferScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('WifiTransferPage'),),
            body: Container(),
        );
    }
}