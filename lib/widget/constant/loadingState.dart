import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widget/constant/constantColor.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constColor().GetstartedScreenColor,
      body: const Center(child: CircularProgressIndicator(color: Colors.white,),),
    );
  }
}