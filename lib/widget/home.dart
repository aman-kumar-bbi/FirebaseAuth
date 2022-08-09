import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widget/screens/registerScreen/RegisterScreen.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';
import 'package:flutter_application_1/widget/screens/splashScreen.dart';
import 'package:flutter_application_1/widget/constant/getStartedButton.dart';
import 'package:flutter_application_1/widget/screens/welcomeScreen.dart';
import 'package:flutter_application_1/widget/wrapper.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
        if (snapshot.hasData) {
          return welcomePage();
          
        }else if(snapshot.hasError){
          return Center(child: Text("Somthing went wrong."),);
        }else{
          return wrapper();
        }
      }),
    );
  }
}