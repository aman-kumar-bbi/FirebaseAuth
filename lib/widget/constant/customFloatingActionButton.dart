import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widget/constant/constantColor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/registerScreen/RegisterScreen.dart';
import '../screens/signInScreeen/bloc/sign_in_bloc.dart';

class customFloatingButton extends StatelessWidget {
  const customFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(bottom:43.0,right: 15  ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => SignInBloc(),
                          child: RegisterScreen(),
                        )),
              );
                    },
                    child: Icon(Icons.add,size: 30,),
                    style: ElevatedButton.styleFrom(
                      primary: constColor().registrationScreenColor,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              );
  }
}