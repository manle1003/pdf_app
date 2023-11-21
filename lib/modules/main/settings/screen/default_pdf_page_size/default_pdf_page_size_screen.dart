import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'default_pdf_page_size_controller.dart';

class DefaultPdfPageSizeScreen extends GetView<DefaultPdfPageSizeController> {
  const DefaultPdfPageSizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DefaultPdfPageSizePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DefaultPdfPageSizePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
