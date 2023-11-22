import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../app_controller.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/widgets/custom_text_style.dart';
import '../../../../../theme/theme_helper.dart';
import 'about_us_controller.dart';

class AboutUsScreen extends GetView<AboutUsController> {
  AboutUsScreen({super.key});
  final AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PDF Scanner'.tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Lottie.asset('assets/svgs/lottie_logo_about.json'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'PDF Scanner'.tr,
                style: CustomTextStyles.labelBlack500Size24Fw600,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                '1.0.0',
                style: TextStyle(
                    color: appController.isDarkModeOn.value
                        ? appTheme.gray100
                        : ColorConstants.blackText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'contentAboutAppFirst'.tr,
                style: TextStyle(
                  color: appController.isDarkModeOn.value
                      ? appTheme.gray100
                      : ColorConstants.grey800,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("keyFeature".tr,
                    style: CustomTextStyles.labelBlack500Size18Fw600),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "contentKeyFeatureFirst".tr,
                      style: CustomTextStyles.labelGray600Size14Fw600,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "contentKeyFeatureTow".tr,
                      style: CustomTextStyles.labelGray600Size14Fw600,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "contentKeyFeatureThree".tr,
                      style: CustomTextStyles.labelGray600Size14Fw600,
                    ),
                    Text(
                      "contentKeyFeatureFor".tr,
                      style: CustomTextStyles.labelGray600Size14Fw600,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "contentAboutAppp".tr,
                style: CustomTextStyles.labelBlack500Size18Fw600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
