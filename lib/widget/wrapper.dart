import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widget/screens/registerScreen/RegisterScreen.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';
import 'package:flutter_application_1/widget/screens/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class wrapper extends StatelessWidget {
  // const wrapper({Key? key}) : super(key: key);
bool showHome=false;
Future check()async{
    final pref = await SharedPreferences.getInstance();
    final showHome = pref.getBool('showHome') ?? false;
}
  @override
  Widget build(BuildContext context) {
    print("showHome $showHome");
    return Getstarted();
  }
}