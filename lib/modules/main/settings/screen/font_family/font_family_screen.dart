import 'package:flutter/material.dart';
import 'package:flutter_getx_base/lang/constants_common.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'font_family_controller.dart';

class FontFamilyScreen extends GetView<FontFamilyController> {
  const FontFamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantsCommon.selectFont.tr,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done),
          ),
        ],
      ),
      body: ListView.builder(
        itemExtent: 50,
        itemCount: 500,
        itemBuilder: (context, index) {
          final fontFamily = controller.fontFamilies[index];
          return Obx(
            () {
              return ListTile(
                leading: Text(fontFamily),
                title: Text(
                  ConstantsCommon.pdfScanner.tr,
                  style: GoogleFonts.getFont(fontFamily),
                  textAlign: TextAlign.center,
                ),
                trailing: Radio(
                  value: fontFamily,
                  groupValue: controller.selectedOption.value,
                  onChanged: (value) {
                    controller.selectedOption.value = value ?? '';
                  },
                  activeColor: Colors.green,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
