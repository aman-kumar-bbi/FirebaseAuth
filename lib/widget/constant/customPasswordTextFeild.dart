import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constantText.dart';

class CustomPasswordFeild extends StatefulWidget {
  // const CustomPasswordFeild({Key? key}) : super(key: key);
  Function onchanged;
  // TextEditingController customcontroller;
  CustomPasswordFeild({required this.onchanged});

  @override
  State<CustomPasswordFeild> createState() => _CustomPasswordFeildState();
}
bool _passwordVisible = false;
@override
void initState() {
  _passwordVisible = false;
}


class _CustomPasswordFeildState extends State<CustomPasswordFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onChanged: widget.onchanged(),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.white),
                      label: Text(allText().userPassword,
                          style: TextStyle(color: Colors.white)),
                      
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) =>
                        value!.length<8 ? "Password should be greater then 8 letters" : null,
                       
                        // controller: widget.customcontroller,
                  );
  }
}