import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamilyController extends GetxController {
  List<String> fontFamilies = GoogleFonts.asMap().keys.toList();
  RxString selectedOption = "".obs;

  @override
  void onInit() {
    super.onInit();
    selectedOption.value = fontFamilies[0];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
