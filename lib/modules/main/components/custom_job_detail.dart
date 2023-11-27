import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:get/get.dart';

import '../../../shared/utils/size_config.dart';

class CustomJobDetail extends StatelessWidget {
  const CustomJobDetail({
    required this.textTitle,
    required this.textDescription,
    required this.iconData,
    this.colorIcon,
    Key? key,
  }) : super(key: key);

  final String? textTitle;
  final String? textDescription;
  final IconData? iconData;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppController appController = Get.find();

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              top: SizeConfig().screenWidth * 0.04,
              left: 8,
              right: 8,
            ),
            decoration: BoxDecoration(
                color: appController.isDarkModeOn.value
                    ? ColorConstants.grey800
                    : Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ]),
            child: Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 8,
                right: 8,
                left: 8,
              ),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: appController.isDarkModeOn.value
                            ? ColorConstants.white.withOpacity(.1)
                            : Color(0xffe4e9f7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          iconData,
                          color: colorIcon,
                          size: 24,
                        ),
                      )),
                  SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: Container(
                      width: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textTitle ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              color: appController.isDarkModeOn.value
                                  ? ColorConstants.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
