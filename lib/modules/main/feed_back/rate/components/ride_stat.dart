import 'package:flutter/material.dart';

import '../../../../../shared/constants/colors.dart';

class TourStats extends StatelessWidget {
  const TourStats({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TourInfo(
          title: 'Duration:',
          value: '2 days',
        ),
        TourInfo(
          title: 'Price:',
          value: '\$299.99',
        ),
        TourInfo(
          title: 'Owner:',
          value: 'Itzman',
        ),
      ],
    );
  }
}

class TourInfo extends StatelessWidget {
  const TourInfo({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorConstants.blackColor,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: ColorConstants.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
