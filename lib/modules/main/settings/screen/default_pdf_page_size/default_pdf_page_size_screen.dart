// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_getx_base/lang/constants_common.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/introduction/components/default_button.dart';
import 'package:get/get.dart';
import 'default_pdf_page_size_controller.dart';
import 'model/pdf_size_model.dart';

class DefaultPdfPageSizeScreen extends GetView<DefaultPdfPageSizeController> {
  const DefaultPdfPageSizeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantsCommon.selectPdfSize.tr,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ListView.builder(
              itemCount: pdfSizeData.length,
              itemBuilder: (context, index) {
                Map<String, String> item = pdfSizeData[index];
                return Obx(
                  () {
                    return ListTile(
                      onTap: () {
                        controller.selectedOption.value = item;
                      },
                      title: Text(item['name'] ?? ''),
                      subtitle: Text(item['size'] ?? ''),
                      trailing: Radio(
                        value: item,
                        groupValue: controller.selectedOption.value,
                        onChanged: (value) {
                          controller.selectedOption.value = value ?? {};
                        },
                        activeColor: Colors.green,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 50,
              ),
              color: Color(0xfff0f0f0),
              width: double.infinity,
              child: DefaultButton(
                text: ConstantsCommon.addNewSize.tr,
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
