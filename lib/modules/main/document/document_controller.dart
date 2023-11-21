import 'package:get/get.dart';

class DocumentController extends GetxController {
  RxList<String> documentList = <String>[
    'Document 1',
    'Document 2',
    'Document 3',
  ].obs;

  RxBool isCheck = false.obs;
  RxList<String> searchResults = <String>[].obs;
  void filterEvents(String keyword) {
  final myData = documentList;

  if (keyword.isEmpty) {
    searchResults.value = myData;
  } else {
    searchResults.value = myData
        .where((event) => event.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}

}
