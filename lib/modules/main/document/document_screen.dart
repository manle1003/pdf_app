import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/lang/constants_common.dart';
import 'package:flutter_getx_base/modules/main/document/document_controller.dart';
import 'package:get/get.dart';

import '../components/custom_search_field.dart';
import 'components/pdf_file_items.dart';

class DocumentScreen extends GetView<DocumentController> {
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ConstantsCommon.myDocument.tr,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            offset: Offset(-20, 40),
            onSelected: (value) {
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'option0',
                  child: Row(
                    children: [
                      Icon(Icons.picture_as_pdf, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        ConstantsCommon.imageToPdf.tr,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Row(
                    children: [
                      Icon(Icons.file_download, color: Colors.orangeAccent),
                      SizedBox(width: 8),
                      Text(
                        ConstantsCommon.importFile.tr,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'option2',
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        ConstantsCommon.editFile.tr,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchField(
                hintText: ConstantsCommon.enterSearch.tr,
                onChanged: (value) {
                  controller.isCheck.value = value.isNotEmpty;
                  controller.filterEvents(value);
                },
              ),
            ),
            SizedBox(height: 8.0),
            Obx(
              () {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.isCheck.value
                      ? controller.searchResults.length
                      : controller.documentList.length,
                  itemBuilder: (context, index) {
                    if (controller.searchResults.isNotEmpty) {
                      return PdfFileItems(
                        image: Image.asset(
                            'assets/images/photo-1677577927691-effe37180bdf.jpg'),
                        title: controller.searchResults[index],
                        subtext: 'File Size',
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert, size: 18),
                        ),
                      );
                    } else {
                      return PdfFileItems(
                        image: Image.asset(
                            'assets/images/photo-1677577927691-effe37180bdf.jpg'),
                        title: controller.documentList[index],
                        subtext: 'File Size',
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert, size: 18),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
