import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widget/constant/constantText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/signInScreeen/bloc/sign_In_state.dart';
import '../screens/signInScreeen/bloc/sign_in_bloc.dart';

class CreateAccountButton extends StatelessWidget {
  // const CreaetAccountButton({Key? key}) : super(key: key);
  Function OnpressFunction;
  CreateAccountButton({required this.OnpressFunction});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        height: height * 0.064,
        width: width * 0.34,
        decoration: BoxDecoration(
            color: (state is signInValidState) ? Colors.pink : Colors.grey,
            border: Border.all(color: Colors.white)),
        child: Center(
          child: Text(
            allText().createAccount,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}

      // TextButton(0
      //     child: Text(allText().createAccount,
      //         style: const TextStyle(fontSize: 14)),
      //     style: ButtonStyle(
      //         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(top:15,bottom: 15,left: 20,right: 20)),
      //         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //             RoundedRectangleBorder(side: BorderSide(color: Colors.white)))),
      //     onPressed: () => OnpressFunction());