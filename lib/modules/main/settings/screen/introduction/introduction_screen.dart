import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/introduction_content.dart';
import 'introduction_controller.dart';
import 'model/introduction_model.dart';

class IntroductionScreen extends GetView<IntroductionController> {
  IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntroductionPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: introductionData.length,
                  itemBuilder: (context, index) => IntroductionContent(
                    image: 'assets/images/image1.PNG',
                    text: introductionData[index]["text"] ?? '',
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              buildDot(),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Next (1/7)',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot() {
    return Container(
      margin: EdgeInsets.only(right: 6),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
