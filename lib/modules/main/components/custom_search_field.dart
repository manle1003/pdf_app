import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../lang/constants_common.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  const CustomSearchField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: ConstantsCommon.search.tr,
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
