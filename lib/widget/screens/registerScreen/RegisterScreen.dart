import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sharePreference/sharePreference.dart';
// import 'package:flutter_application_1/firebaseAuth/SignInFunction.dart';

import 'package:flutter_application_1/widget/constant/customSizedBox.dart';
import 'package:flutter_application_1/widget/constant/customTextFormFeild.dart';
import 'package:flutter_application_1/widget/constant/constantText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../firebaseAuth/firebaseAllFunction.dart';
import '../../constant/constantColor.dart';
import '../../constant/constantText.dart';
import '../signInScreeen/bloc/sign_In_state.dart';
import '../signInScreeen/bloc/sign_in_bloc.dart';
import '../signInScreeen/bloc/sign_in_event.dart';
import '../signInScreeen/signInScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

bool _passwordVisible = false;
@override
void initState() {
  _passwordVisible = false;
}

TextEditingController FirstNameController = TextEditingController();
TextEditingController LastNameController = TextEditingController();
TextEditingController EmailController = TextEditingController();
TextEditingController PasswordController = TextEditingController();
const Color colorFortheScreen = Color.fromRGBO(237, 76, 1120, 1);

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: constColor().registrationScreenColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mySizedBox(height: 50),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    mySizedBox(height: 20),
                    Text(
                      allText().bbRegister,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    customTextFeild(
                        customcontroller: FirstNameController,
                        onchanged: () {},
                        labelText: allText().userFirstName,
                        validatorText: "First Name cannot be blank"),
                    mySizedBox(height: 15),
                    customTextFeild(
                        onchanged: () {},
                        customcontroller: LastNameController,
                        labelText: allText().userLastName,
                        validatorText: "Last Name cannot be blank"),
                    mySizedBox(height: 15),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Email cannot be blank' : null,
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
                            allText().userEmail,
                            style: TextStyle(color: Colors.white),
                          ),
                          errorStyle: TextStyle(color: Colors.white)),
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
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
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
                      controller: PasswordController,
                      onChanged: (val) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInTextChangedEvent(
                                emailValue: EmailController.text,
                                passwordValue: PasswordController.text));
                      },
                    ),
                    mySizedBox(height: 150),
                    BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (validateAndSave() == true) {
                                if (state is signInValidState) {
                                  FirebaseFunction().signup(
                                      context,
                                      EmailController,
                                      PasswordController,
                                      FirstNameController.text,
                                      " ${LastNameController.text}");
                                  
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text(
                                        'Please enter the correct credentials'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            child: Container(
                              height: height * 0.04,
                              width: width * 0.38,
                              decoration: BoxDecoration(
                                  color: constColor().registrationScreenColor,
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: Text(
                                allText().createAccount,
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
          ),
        ),
      );
    });
  }

  validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      // UserName().storingFirstNameInDB(FirstNameController.text);
      // UserName().storingLastNameInDB(" ${LastNameController.text}");
      // FirebaseFunction().signup(context, EmailController, PasswordController,
      //     FirstNameController.text, " ${LastNameController.text}");
      return true;
    } else {
      print('Form is invalid');
      return false;
    }
  }

  // void signup(BuildContext context, TextEditingController email,
  //     TextEditingController password, String FirstName, String LastName) async {
  //   try {
  //     UserCredential result =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email.text.trim(),
  //       password: password.text,
  //     );
  //     User? user = result.user;
  //     final Name = await user!.updateProfile(displayName: FirstName + LastName);
  //     Navigator.pop(context);
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => BlocProvider.value(
  //                 value: SignInBloc(), child: const SignInScreen())));
  //   } on FirebaseAuthException catch (e) {
  //     var error = e.toString();

  //     print(e);
  //   }
  // }
}
