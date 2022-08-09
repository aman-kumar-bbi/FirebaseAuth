import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserName {
    Future storingFirstNameInDB(String FirstName) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('firstName',FirstName);
  }

  Future storingLastNameInDB(String SecondName) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('last_name', SecondName);
  }

  Future<String?> getFirstName()async{
    final pref = await SharedPreferences.getInstance();
    String FirstName=pref.getString('firstName').toString();
    // var decoded=jsonDecode(FirstName);
    return FirstName;
  }
}