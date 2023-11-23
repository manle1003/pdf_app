import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../shared/constants/colors.dart';
import 'rounded_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedButton(
          icon: const Icon(Icons.arrow_back),
          iconColor: Colors.white,
          bgColor: ColorConstants.backgroundColorButtonGreen,
          tap: () {
            Get.back();
          },
        ),
        const SizedBox(width: 16),
        Text(
          'Feedback',
          style: TextStyle(
            color: ColorConstants.backgroundColorButtonGreen,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
