import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/constant/constantText.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getStartedButton extends StatelessWidget {
  const getStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        final pref=await SharedPreferences.getInstance();
        pref.setBool('showHome', true);


        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      },
      child: Container(
        height: 40,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.orange,
        ),
        child: Center(
            child: Text(
          allText().bbGetStarted,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        )),
      ),
    );
  }
}
