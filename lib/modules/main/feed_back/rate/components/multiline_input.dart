import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../lang/constants_common.dart';
import '../../../../../shared/constants/colors.dart';

class MultilineInput extends StatelessWidget {
  const MultilineInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                offset: const Offset(0.0, 15.0),
                color: ColorConstants.black.withAlpha(20))
          ]),
      child: TextField(
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: ConstantsCommon.additionalComments.tr,
            hintStyle: TextStyle(
              color: ColorConstants.greyColor,
            )),
      ),
    );
  }
}
