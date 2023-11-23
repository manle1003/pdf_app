// ignore_for_file: unrelated_type_equality_checks, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_getx_base/modules/main/components/tabIcon_data.dart';
import 'package:flutter_getx_base/modules/main/document/document_screen.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_controller.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/settings_screen.dart';
import 'package:flutter_getx_base/modules/main/tool/tool_screen.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:flutter_getx_base/theme/theme_helper.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'bottom_bar_view.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> with TickerProviderStateMixin {
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  AnimationController? animationController;

  bool isSideBarOpen = false;
  bool isHomeScreen = true;

  SMIBool? isMenuOpenInput;
  DateTime? currentBackPressTime;

  Widget tabBody = Container(
    color: ColorConstants.white,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    tabBody = HomeScreen();

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() {
            tabIconsList.forEach((tab) {
              tab.isSelected = tab.index == 0;
              _currentIndex = 0;
            });
          });
          animationController?.reverse().then<dynamic>((data) {
            if (!mounted) {
              return;
            }
            setState(() {
              tabBody = HomeScreen();
            });
          });
          return false;
        }
        return homeController.onWillPop();
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.gray200,
        body: Stack(
          children: [
            tabBody,
            bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            setState(() {
              _currentIndex = index;
            });
            if (_currentIndex == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = HomeScreen();
                });
              });
            } else if (_currentIndex == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = DocumentScreen();
                });
              });
            } else if (_currentIndex == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = ToolScreen();
                });
              });
            } else if (_currentIndex == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = SettingsScreen();
                });
              });
            }
          },
        ),
      ],
    );
  }
}
