import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';

abstract class SignInState {}


class signInInitialState extends SignInState {} 

class signInValidState extends SignInState {} 


// class signInErrorState extends SignInState {
//   final String errorMessage;
//   signInErrorState(this.errorMessage);
// } 

class signInLoadingState extends SignInState {
 
} 
