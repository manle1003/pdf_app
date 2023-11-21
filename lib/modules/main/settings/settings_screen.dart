import 'package:flutter/material.dart';
import 'package:flutter_getx_base/modules/main/document/components/pdf_file_items.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:get/get.dart';
import '../../../models/settings_model/setting_model.dart';
import 'settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        padding: getPadding(bottom: 100),
        itemCount: settingsItems.length,
        itemBuilder: (context, index) {
          SettingsItemsModel item = settingsItems[index];
          return GestureDetector(
            onTap: item.function,
            child: PdfFileItems(
              image: item.image,
              title: item.title,
              subtext: item.subtext,
              iconButton: item.iconButton,
              isCheckDisplayIcon: item.isCheckDisplayIcon,
            ),
          );
        },
      ),
    );
  }
}
