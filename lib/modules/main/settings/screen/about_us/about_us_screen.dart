import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_us_controller.dart';

class AboutUsScreen extends GetView<AboutUsController> {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutUsPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AboutUsPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
