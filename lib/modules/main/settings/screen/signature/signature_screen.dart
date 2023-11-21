import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signature_controller.dart';

class SignatureScreen extends GetView<SignatureController> {
  const SignatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignaturePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignaturePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
