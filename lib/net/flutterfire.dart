import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

Future<bool> signIn(String email, String password) async{
  
try {
  // ignore: unused_local_variable
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,);
  return true;
  
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    return false;
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    return false;
  }
  return false;
}
}
Future<bool> register(String email, String password) async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
   return true;
  } on FirebaseAuthException catch (e){
    if (e.code == 'weak-passsword'){
      print('the password is too weak');
    }else if (e.code == 'email-already-in-use'){
      print('The account already exists');
    }
    return false;
  }catch(e){
    print(e.toString());
    return false;
  }
}
