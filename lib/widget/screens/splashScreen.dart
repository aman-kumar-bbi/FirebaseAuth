import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widget/constant/constantColor.dart';
import 'package:flutter_application_1/widget/constant/getStartedButton.dart';
import 'package:flutter_application_1/widget/constant/constantText.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constColor().GetstartedScreenColor, 
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: constColor().GetstartedScreenColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/BBI_logo.png'),
            Text(
              allText().bbAccount,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => SignInBloc(),
                          child: SignInScreen(),
                        )),
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
