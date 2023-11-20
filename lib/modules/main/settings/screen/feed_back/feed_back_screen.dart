import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feed_back_controller.dart';

class FeedBackScreen extends GetView<FeedBackController> {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeedBackPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FeedBackPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
