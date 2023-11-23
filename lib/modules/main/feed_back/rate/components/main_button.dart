import 'package:flutter/material.dart';
import 'package:flutter_getx_base/modules/main/feed_back/rate/components/rounded_button.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
         Text(
          'Submit',
          style: TextStyle(
              color: ColorConstants.backgroundColorButtonGreen,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        const SizedBox(width: 16),
        RoundedButton(
            icon: const Icon(Icons.arrow_forward),
            iconColor: Colors.white,
            bgColor: ColorConstants.backgroundColorButtonGreen,
            tap: () {})
      ],
    );
  }
}
