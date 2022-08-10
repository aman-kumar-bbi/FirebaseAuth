import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/bloc/sign_In_state.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/bloc/sign_in_event.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{

SignInBloc():super(signInInitialState()){

on<SignInTextChangedEvent>((event, emit) {
  // if (event.emailValue=='') {
  //   emit (signInErrorState("please enter a valid email address"));
  // }else if(event.passwordValue.length<8){
  //   emit (signInErrorState("please enter a vaild password"));
  // }
  // else{
    emit (signInValidState()); 
  // }
});
  
on<SignInSubmittedEvent>((event, emit) {
  emit(signInLoadingState());
  
});

}
  
}