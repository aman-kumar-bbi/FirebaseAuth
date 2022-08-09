import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constantText.dart';

class customTextFeild extends StatelessWidget {
  // const customTextFeild({Key? key}) : super(key: key);
  String labelText;
  String validatorText;
  Function onchanged;
  TextEditingController customcontroller;
//  TextEditingController customcontroller;
  customTextFeild(
      {required this.labelText,
      required this.validatorText,
      required this.onchanged,
      required this.customcontroller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: customcontroller,
      // onChanged: onchanged(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.white,
          label: Text(
            labelText,
            style: TextStyle(color: Colors.white),
          ),
          errorStyle: TextStyle(color: Colors.white)),

      // controller: customcontroller,
    );
  }
}
