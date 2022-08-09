import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class mySizedBox extends StatelessWidget {
  // const mySizedBox({Key? key}) : super(key: key);
  double height;
  mySizedBox({required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}