import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/default_button.dart';
import 'components/introduction_content.dart';
import 'introduction_controller.dart';
import 'model/introduction_model.dart';

class IntroductionScreen extends GetView<IntroductionController> {
  IntroductionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduction'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.onPageChanged(value);
                },
                itemCount: introductionData.length,
                itemBuilder: (context, index) => IntroductionContent(
                  image: 'assets/images/image1.PNG',
                  text: introductionData[index]["text"] ?? '',
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Obx(
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          introductionData.length,
                          (index) => buildDot(index: index),
                        ).toList(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () {
                      return DefaultButton(
                        text: 'Next (${controller.currentPage.value.toString()}/7)',
                        press: () {
                          controller.onNextButtonClick();
                        },
                        height: 40,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(right: 6),
      height: 6,
      width: controller.currentPage.value == index! + 1 ? 20 : 6,
      decoration: BoxDecoration(
        color: controller.currentPage.value == index + 1
            ? Colors.green
            : Color(0xffd8d8d8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
