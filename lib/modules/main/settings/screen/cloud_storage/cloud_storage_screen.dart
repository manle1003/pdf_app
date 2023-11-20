import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cloud_storage_controller.dart';

class CloudStorageScreen extends GetView<CloudStorageController> {
  const CloudStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CloudStoragePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CloudStoragePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
