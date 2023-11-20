import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
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
        title: Text('My Documents'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchField(
                hintText: 'Enter your search query',
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
