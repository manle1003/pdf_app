import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/theme/theme_helper.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class RiveUtils {
  static SMIBool getRiveInput(Artboard artboard,
      {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    artboard.addController(controller!);

    return controller.findInput<bool>("active") as SMIBool;
  }

  static void changeSMIBoolState(SMIBool input) {
    input.change(true);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        input.change(false);
      },
    );
  }

  static void showSuccessDialog(
      String title, BuildContext context, Function() onPressOk) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      desc: title,
      btnOkOnPress: onPressOk,
      btnOkText: "OK",
      descTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.green,
        fontWeight: FontWeight.w700,
      ),
    )..show();
  }

  static void showFailedDialog(
      String title, BuildContext context, Function() onPressOk) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      desc: title,
      btnOkOnPress: () {},
      btnOkText: 'Close'.tr,
      btnOkColor: Colors.red,
      descTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.red,
        fontWeight: FontWeight.w700,
      ),
    )..show();
  }

  static void showWarningDialog(
      String title, BuildContext context, Function() onpressOk) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      desc: title,
      btnOkOnPress: onpressOk,
      btnCancelOnPress: () {},
      btnOkText: 'OK'.tr,
      btnCancelText: 'Close'.tr,
      btnOkColor: Colors.red,
      btnCancelColor: appTheme.gray400,
      descTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.red,
        fontWeight: FontWeight.w700,
      ),
    )..show();
  }
}
