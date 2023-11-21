import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_language_controller.dart';

class AppLanguageScreen extends GetView<AppLanguageController> {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppLanguagePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AppLanguagePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
