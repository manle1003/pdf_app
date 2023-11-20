import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_lock_controller.dart';

class AppLockScreen extends GetView<AppLockController> {
  const AppLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppLockPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AppLockPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
