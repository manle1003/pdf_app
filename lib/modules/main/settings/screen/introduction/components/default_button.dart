import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
    this.count = '0',
    this.height = 50.0,
  });

  final String text;
  final String count;
  final double height;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: press,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
