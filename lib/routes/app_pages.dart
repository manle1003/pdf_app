import 'package:flutter_getx_base/modules/auth/auth_binding.dart';
import 'package:flutter_getx_base/modules/auth/login/login_screen.dart';
import 'package:flutter_getx_base/modules/main/components/bottom_navigation_view/entry_point.dart';
import 'package:flutter_getx_base/modules/main/feed_back/feed_back_binding.dart';
import 'package:flutter_getx_base/modules/main/feed_back/feed_back_screen.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_binding.dart';
import 'package:flutter_getx_base/modules/main/home_screen/home_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/about_us/about_us_binding.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/about_us/about_us_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/app_language/app_language_binding.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/app_language/app_language_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/default_pdf_page_size/default_pdf_page_size_binding.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/default_pdf_page_size/default_pdf_page_size_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/font_family/font_family_binding.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/font_family/font_family_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/rating/rating_binding.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/rating/rating_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/signature/signature_binding.dart';
import 'package:flutter_getx_base/modules/main/settings/screen/signature/signature_screen.dart';
import 'package:flutter_getx_base/modules/main/settings/settings_binding.dart';
import 'package:flutter_getx_base/modules/main/settings/settings_screen.dart';
import 'package:flutter_getx_base/modules/splash/splash_binding.dart';
import 'package:flutter_getx_base/modules/splash/splash_view.dart';
import 'package:get/get.dart';
import '../modules/main/settings/screen/introduction/introduction_binding.dart';
import '../modules/main/settings/screen/introduction/introduction_screen.dart';

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

    //Settings
    GetPage(
      name: Routes.SETINGS,
      page: () => SettingsScreen(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.INTRODUCTION,
      page: () => IntroductionScreen(),
      binding: IntroductionBinding(),
    ),

    GetPage(
      name: Routes.DEFAULT_PDF_PAGE_SIZE,
      page: () => DefaultPdfPageSizeScreen(),
      binding: DefaultPdfPageSizeBinding(),
    ),
    GetPage(
      name: Routes.SIGNATURE,
      page: () => SignatureScreen(),
      binding: SignatureBinding(),
    ),
    GetPage(
      name: Routes.FONT_FAMILY,
      page: () => FontFamilyScreen(),
      binding: FontFamilyBinding(),
    ),
    GetPage(
      name: Routes.APP_LANGUAGE,
      page: () => AppLanguageScreen(),
      binding: AppLanguageBinding(),
    ),
    GetPage(
      name: Routes.FEED_BACK,
      page: () => FeedBackScreen(),
      binding: FeedBackBinding(),
    ),
    GetPage(
      name: Routes.RATING,
      page: () => RatingScreen(),
      binding: RatingBinding(),
    ),
    GetPage(
      name: Routes.ABOUT_US,
      page: () => AboutUsScreen(),
      binding: AboutUsBinding(),
    ),
  ];
}
