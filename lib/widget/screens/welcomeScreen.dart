import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebaseAuth/firebaseAllFunction.dart';
import 'package:flutter_application_1/widget/constant/constantColor.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcomePage extends StatefulWidget {
  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  var CurrUser;
  @override
  void initState() {
    CurrUser = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
        elevation: 0,
        // actions: [
        //   IconButton(
        //        onPressed: () async {
        //           await FirebaseFunction().signout();
        //           },
        //       icon: Icon(
        //         Icons.logout_outlined,
        //         color: Colors.white,
        //       ))
        // ],
      ),
      backgroundColor: constColor().GetstartedScreenColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello 👋",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "${check()}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Text(
                  "Have a nice day",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "Email : ${CurrUser?.email}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ShapeOfView(
                elevation: 4,
                height: 170,
                shape: DiagonalShape(
                    position: DiagonalPosition.Top,
                    direction: DiagonalDirection.Left,
                    angle: DiagonalAngle.deg(angle: 15)),
                child: Container(
                  color: Colors.pink[300],
                )),
          ),
        ],
      ),
    );
  }

  check() {
    if (CurrUser.displayName == null) {
      print("enter in the function");
      setState(() {});
      return CurrUser.displayName;
    } else {
      print("enter in the else");
      return CurrUser.displayName;
    }
  }
}
