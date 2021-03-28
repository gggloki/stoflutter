import 'package:demo/authentication.dart';
//import 'package:demo/control/auto_fill.dart';
//import 'package:demo/src/Myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";

//import 'model/login_page.dart';
//import 'package:demo/src/Myapp.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main()async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Sto',
      home: Authentication(),
    );
  }
}