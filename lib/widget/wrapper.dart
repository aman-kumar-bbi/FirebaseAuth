import 'package:flutter/material.dart';
import 'package:flutter_application_1/sharePreference/sharePreference.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';
import 'package:flutter_application_1/widget/screens/splashScreen.dart';

class wrapper extends StatefulWidget {
  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: sharedPreferences().returnIsShowHomePage(),
          builder: (context, snapshot) {
            print("wrapper ${snapshot.hasData}");
            if (snapshot.hasData != false) {
              return SignInScreen();
            } else {
              return Getstarted();
            }
          }),
    );
  }
}
