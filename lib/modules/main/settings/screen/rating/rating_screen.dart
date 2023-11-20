import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'rating_controller.dart';

class RatingScreen extends GetView<RatingController> {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RatingPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RatingPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
