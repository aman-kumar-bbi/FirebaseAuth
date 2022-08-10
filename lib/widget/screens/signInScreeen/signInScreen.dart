import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebaseAuth/firebaseAllFunction.dart';
import 'package:flutter_application_1/widget/constant/constantText.dart';
import 'package:flutter_application_1/widget/constant/customFloatingActionButton.dart';
import 'package:flutter_application_1/widget/constant/customSizedBox.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/bloc/sign_In_state.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/bloc/sign_in_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

import '../../constant/constantColor.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

bool _passwordVisible = false;
@override
void initState() {
  _passwordVisible = false;
}

TextEditingController EmailController = TextEditingController();
TextEditingController PasswordController = TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  color: constColor().LoginScreenColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mySizedBox(height: 90),
                        Text(
                          allText().login,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        mySizedBox(height: 15),
                        TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? 'Email cannot be blank' : null,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              label: Text(
                                allText().userEmail,
                                style: const TextStyle(color: Colors.white),
                              ),
                              errorStyle: const TextStyle(color: Colors.white)),
                          controller: EmailController,
                          onChanged: (val) {
                            BlocProvider.of<SignInBloc>(context).add(
                                SignInTextChangedEvent(
                                    emailValue: EmailController.text,
                                    passwordValue: PasswordController.text));
                          },
                        ),
                        mySizedBox(height: 15),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) => value!.isEmpty
                              ? 'Password should be greater then 8'
                              : null,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.text,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            errorStyle: const TextStyle(color: Colors.white),
                            label: Text(allText().userPassword,
                                style: const TextStyle(color: Colors.white)),
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
                          controller: PasswordController,
                          onChanged: (val) {
                            BlocProvider.of<SignInBloc>(context).add(
                                SignInTextChangedEvent(
                                    emailValue: EmailController.text,
                                    passwordValue: PasswordController.text));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        mySizedBox(height: 20),
                        BlocBuilder<SignInBloc, SignInState>(
                            builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                
                                    if (state is signInValidState) {
                                     FirebaseFunction().signIn(context, EmailController, PasswordController);
                                    } else {
                                      const snackBar = SnackBar(
                                        content: Text(
                                            'Please enter the correct credentials'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                            
                                },
                                child: Container(
                                  height: height * 0.04,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                      color: constColor().LoginScreenColor,
                                      border: Border.all(color: Colors.white)),
                                  child: Center(
                                      child: Text(
                                    allText().login,
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ShapeOfView(
                      elevation: 4,
                      height: 200,
                      shape: DiagonalShape(
                          position: DiagonalPosition.Top,
                          direction: DiagonalDirection.Left,
                          angle: DiagonalAngle.deg(angle: 20)),
                      child: Container(
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, left: 10),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        allText().termAndCondition,
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
                customFloatingButton()
              ],
            ),
          ));}
    );
  }

  validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      print('Form is invalid');
      return false;
    }
  }
}
