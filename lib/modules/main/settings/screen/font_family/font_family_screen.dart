import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'font_family_controller.dart';

class FontFamilyScreen extends GetView<FontFamilyController> {
  const FontFamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FontFamilyPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FontFamilyPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
