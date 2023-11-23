import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_language_controller.dart';
import 'components/language_widget.dart';

class AppLanguageScreen extends GetView<AppLanguageController> {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select language'),
        centerTitle: true,
      ),
      body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    LanguageWidget(
                        flag: '🇺🇸',
                        label: 'ENGLISH',
                        locale: 'en',
                        index: 0),
                    LanguageWidget(
                        flag: '🇻🇳',
                        label: 'VIỆT NAM',
                        locale: 'vi',
                        index: 1),
                    LanguageWidget(
                      flag: '🇰🇷',
                      label: '한국어',
                      locale: 'ko',
                      index: 2,
                    ),
                    LanguageWidget(
                      flag: '🇨🇳',
                      label: '中文',
                      locale: 'cn',
                      index: 3,
                    ),
                    LanguageWidget(
                        flag: '🇦🇹',
                        label: 'ÖSTERREICH DEUTSCH',
                        locale: 'de_AT',
                        index: 4),
                    LanguageWidget(
                        flag: '🇩🇪',
                        label: 'DEUTSCH',
                        locale: 'de',
                        index: 5),
                    LanguageWidget(
                        flag: '🇬🇷',
                        label: 'ΕΛΛΗΝΙΚΑ',
                        locale: 'el',
                        index: 6),
                    LanguageWidget(
                        flag: '🇪🇸',
                        label: 'ESPAÑOL',
                        locale: 'es',
                        index: 7),
                    LanguageWidget(
                        flag: '🇫🇷',
                        label: 'FRANÇAIS',
                        locale: 'fr',
                        index: 8),
                    LanguageWidget(
                        flag: '🇭🇷',
                        label: 'HRVATSKI',
                        locale: 'hr',
                        index: 9),
                    LanguageWidget(
                        flag: '🇭🇺',
                        label: 'MAGYAR',
                        locale: 'hu',
                        index: 10),
                    LanguageWidget(
                        flag: '🇮🇹',
                        label: 'ITALIANO',
                        locale: 'it',
                        index: 11),
                    LanguageWidget(
                        flag: '🇯🇵',
                        label: '日本語',
                        locale: 'jp',
                        index: 12),
                    LanguageWidget(
                        flag: '🇳🇱',
                        label: 'NEDERLANDS',
                        locale: 'nl',
                        index: 13),
                    LanguageWidget(
                        flag: '🇵🇱',
                        label: 'POLSKI',
                        locale: 'pl',
                        index: 14),
                    LanguageWidget(
                        flag: '🇧🇷',
                        label: 'PORTUGUÊS (BRASIL)',
                        locale: 'ptBR',
                        index: 15),
                    LanguageWidget(
                        flag: '🇷🇴',
                        label: 'LIMBA ROMÂNĂ',
                        locale: 'ro',
                        index: 16),
                    LanguageWidget(
                        flag: '🇷🇺',
                        label: 'РУССКИЙ',
                        locale: 'ru',
                        index: 17),
                    LanguageWidget(
                        flag: '🇹🇷',
                        label: 'TÜRKÇE',
                        locale: 'tr',
                        index: 18),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Align(alignment: Alignment.bottomCenter, child: isShowAdsNative())
      ],
              ),
    );
  }
}
