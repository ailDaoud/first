import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizationCheker {
  static changeLanguage(BuildContext context) {
    Locale? curretLocal =
        EasyLocalization.of(context as BuildContext)!.currentLocale;
    if (curretLocal == const Locale("en")) {
      EasyLocalization.of(context)!.setLocale(const Locale("ar"));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale("en"));
    }
  }
}
