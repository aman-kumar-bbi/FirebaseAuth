import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../widget/screens/signInScreeen/signInScreen.dart';
import '../widget/screens/welcomeScreen.dart';

class FirebaseFunction {
  void signup(
      BuildContext context,
      TextEditingController email,
      TextEditingController password,
      String FirstName,
      String LastName
      ) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text,
      );
      User? user = result.user;
      final Name= await user!.updateProfile(displayName: FirstName+LastName);
      // print("$Name");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => welcomePage( )));
    } on FirebaseAuthException catch (e) {
      var error = e.toString();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error Ocurred")));
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
   
          /*
          Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<appcubit>(context)
      child: cattaskview(),
    )
  )
);
          */
    } on FirebaseAuthException catch (e) {
      var error = e.toString();
      print("erroe is $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error Ocurred")));
      print(e);
    }
  }
}
