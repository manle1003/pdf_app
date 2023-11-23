import 'package:flutter/material.dart';

class IntroductionContent extends StatelessWidget {
  const IntroductionContent({
    super.key,
    required this.image,
    required this.text,
  });
  final String image, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 12,
        ),
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 500,
        ),
      ],
    );
  }
}
