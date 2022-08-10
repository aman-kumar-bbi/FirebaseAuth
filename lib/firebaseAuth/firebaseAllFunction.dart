
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/home.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';
import 'package:flutter_application_1/widget/wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../widget/screens/signInScreeen/signInScreen.dart';
import '../widget/screens/signInScreeen/bloc/sign_in_bloc.dart';
import '../widget/screens/welcomeScreen.dart';

class FirebaseFunction {
  void signup(BuildContext context, TextEditingController email,
      TextEditingController password, String FirstName, String LastName) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text,
      );
      User? user = result.user;
      final Name = await user!.updateProfile(displayName: FirstName + LastName);
        Navigator.pop(context);
       Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    } on FirebaseAuthException catch (e) {
      var error = e.toString();

      print(e);
    }
  }

  void signIn(BuildContext context, TextEditingController email,
      TextEditingController password) async {
    print("signUP");
    try {
      print("signUP try");
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => welcomePage()));
    } catch (e) {
      var error = e.toString();
      print("erroe is $error");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error Ocurred")));
      print(e);
    }
  }

  Future<void> signout() async {
    return await FirebaseAuth.instance.signOut();
  }
}
