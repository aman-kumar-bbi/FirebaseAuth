import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/constant/loadingState.dart';
import 'package:flutter_application_1/widget/home.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/widget/screens/signInScreeen/signInScreen.dart';
import 'package:flutter_application_1/widget/screens/splashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 

  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider(create: (_) => SignInBloc(),child: const LoadingState())

    );
  }

  
}
