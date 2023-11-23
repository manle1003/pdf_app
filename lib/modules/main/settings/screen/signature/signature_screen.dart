import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../lang/constants_common.dart';
import 'signature_controller.dart';

class SignatureScreen extends GetView<SignatureController> {
  const SignatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantsCommon.signature.tr,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            offset: Offset(-20, 40),
            onSelected: (value) {
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        ConstantsCommon.editSignature.tr,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option2',
                  child: Row(
                    children: [
                      Icon(Icons.photo_camera, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        ConstantsCommon.newSignature.tr,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option3',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        ConstantsCommon.deleteAll.tr,
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
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
