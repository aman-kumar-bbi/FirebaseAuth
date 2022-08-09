import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class sharedPreferences {
  Future isShowHome() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('showHome', true);
  }


  Future<bool?> returnIsShowHomePage() async {
    final pref = await SharedPreferences.getInstance();
      final showHome =pref.getBool('showHome');
      return showHome;
  }
}
