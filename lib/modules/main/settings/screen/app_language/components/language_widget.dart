import 'package:flutter/material.dart';
import 'package:flutter_getx_base/app_controller.dart';
// import 'package:flutter_getx_base/shared/sharepreference/sharepreference.dart';
import 'package:flutter_getx_base/shared/utils/size_utils.dart';
import 'package:get/get.dart';

import '../../../../../../lang/lang.dart';
import '../app_language_controller.dart';
// import '../../../lang/translation_service.dart';
// import 'change_language_controller.dart';

class LanguageWidget extends StatelessWidget {
  final String flag;
  final String label;
  final String locale;
  final int index;
  LanguageWidget({
    required this.flag,
    required this.label,
    required this.locale,
    required this.index,
  });

  final AppController appController = Get.find();
  final AppLanguageController appLanguageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TranslationService.changeLocale(
          locale,
        );
        appLanguageController.locateChangeLanguage.value = locale;
        appLanguageController.languageTitle.value = label;
        appLanguageController.indexChangeLanguage.value = index;
        // SharedPreferencesManager.instance.setIndexChangeLanguage(
        //     appLanguageController.indexChangeLanguage.value);
        // SharedPreferencesManager.instance.setLocalTitleChangeLanguage(
        //     appLanguageController.languageTitle.value);
      },
      child: Container(
        height: getSize(56),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        flag,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      if (appLanguageController.indexChangeLanguage ==
                          index)
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.done,
                              color: appController.isDarkModeOn.value
                                  ? Colors.white
                                  : Colors.green,
                              size: getSize(24),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
