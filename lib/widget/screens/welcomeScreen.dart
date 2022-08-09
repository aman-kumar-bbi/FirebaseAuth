import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sharePreference/sharePreference.dart';
import 'package:flutter_application_1/widget/constant/constantColor.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcomePage extends StatefulWidget {
  
  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  String First_Name = '';

  late var pref;
  var CurrUser;
  @override
  void initState() {
    pref = SharedPreferences.getInstance();
    // First_Name=UserName().getFirstName().toString();
    CurrUser = FirebaseAuth.instance.currentUser;
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
        elevation: 0,
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
                  // pref.getString('firstName').toString(),
                  // "${CurrUser?.displayName}",
                  "${check()}",
                  style:const TextStyle(color: Colors.white, fontSize: 20),
                ),
               const Text(
                  "Have a nice day",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "Email : ${CurrUser?.email}",
                  style:const TextStyle(color: Colors.white, fontSize: 20),
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
}
