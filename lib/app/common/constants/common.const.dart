import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CommonConstants {
  static const local = Locale('es', 'ES');
  static const supportedLocales = [Locale('en'), Locale('es')];
  static bool blockUISyncDataOnlineToLocal = true;
  static int pageSizeDefault = 50;

  static get directoryiOS async => await getApplicationDocumentsDirectory();
  static get directoryAndroid async => await getApplicationDocumentsDirectory();
  static Future<String> directory() async {
    if (Platform.isAndroid) {
      return (await directoryAndroid).path;
    } else if (Platform.isIOS) {
      return (await directoryiOS).path;
    } else {
      return "";
    }
  }
}

class Tables{
  static const String personalExpense = "PersonalExpense";
}