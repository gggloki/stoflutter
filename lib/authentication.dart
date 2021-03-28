//import 'dart:html';
import 'package:demo/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import "package:flutter/material.dart";
import 'package:demo/model/ui.dart' as theme;

import 'net/flutterfire.dart';
//import 'package:assets';


// ignore: must_be_immutable
class Authentication extends StatefulWidget{
  
  //TextEditingController emailField = TextEditingController();
  //TextEditingController passwordField = TextEditingController();
  @override
  _AuthenticationState createState()=>_AuthenticationState();

  //Authentication({Key key, this.emailField, this.passwordField}) :super(key:key);

  //Authentication(this._emailField, this._passwordField);
}
class _AuthenticationState extends State<Authentication>{
  // get emailField => null;

  @override
  
   TextEditingController _emailField = TextEditingController();
  
   TextEditingController _passwordField = TextEditingController();
  final User user=FirebaseAuth.instance.currentUser;
  bool shouldNavigate = false ;
  final FocusNode blankNode = FocusNode();
  Widget build(BuildContext context){
        
                return Scaffold(
               appBar: AppBar(
               title:  Text('韵达快递',style: TextStyle(color:Colors.black),  
               ),
               
               
               //titleTextStyle: ,

               //Image.asset(
              //'assets/download.jpg', 
               //height:50,),
               centerTitle: true,
               backgroundColor: Colors.yellow,),
               
                 
               
                //backgroundColor: Colors.deepOrange,),
                  //child : 
              body: 
               
               //Container( 
                // child: image： asset(sto_logo.png),
                //),
            
               Container(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: new BoxDecoration(
                    //image: DecorationImage(
                     // image: AssetImage('images.jpg'),)
            
          
          gradient: theme.Theme.primaryGradient,
          ),
        
          
       
          //image: new AssetImage("images/logo.png"),
            
          
                
                
         
          
          child: 
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(150),
                image: DecorationImage(image:AssetImage('assets/sto_logo.png'
                ),
                //alignment: Alignment.topCenter,
                )
              ),
            ),
           
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: TextFormField(
                  controller: _emailField,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'something@email.com',
                hintStyle: TextStyle( 
                color:Colors.white,),
                labelText: '邮箱',
                labelStyle:TextStyle( color:Colors.black,
                ),
              ),),
            onTap:(){
              FocusScope.of(context).requestFocus(blankNode);
            }),
           TextFormField(
            controller: _passwordField,
            obscureText: true,
             decoration: InputDecoration(
              hintText: '6-16位数字',
              icon: Icon(Icons.lock),
              labelText: '密码',
              labelStyle:TextStyle( color:Colors.black),),),
          new SizedBox(
          width: 100,
          height: 50,
        ),
          Container(
            
            width: MediaQuery.of(context).size.width/1.4,
            height:45,
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.orange,
             ),
             child: MaterialButton(
            // ignore: unused_local_variable
            onPressed:()async{bool shouldNavigate=
             await register(_emailField.text,_passwordField.text);

             if (!user.emailVerified){
             await user.sendEmailVerification();

             }}
             ,
             child: Text('注册'),
            
             ),
          ),
          Container(width: MediaQuery.of(context).size.width/1.4,
            height:45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
             ),
             child: MaterialButton
             (onPressed:()async{bool shouldNavigate=
             await signIn(_emailField.text,_passwordField.text);
             if (shouldNavigate){
               Navigator.push(context,
               MaterialPageRoute(builder: (context)=>HomeView(),),);
               
             }},
             child: Text('登录'),
             ),),
              
        ]
      )
      ),
    );
  }
}
