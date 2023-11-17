import 'package:flutter_getx_base/modules/auth/auth_binding.dart';
import 'package:flutter_getx_base/modules/auth/login/login_screen.dart';
import 'package:flutter_getx_base/modules/main/components/bottom_navigation_view/entry_point.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_binding.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/settings_binding.dart';
import 'package:flutter_getx_base/modules/main/settings/settings_page.dart';
import 'package:flutter_getx_base/modules/splash/splash_binding.dart';
import 'package:flutter_getx_base/modules/splash/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOG_IN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ENTRY_POINT,
      page: () => EntryPoint(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SETINGS,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
  ];
}
