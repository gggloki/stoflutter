//import 'package:demo/control/FormValidationdemo.dart';
import 'package:demo/control/form_widgets.dart';
import 'package:demo/control/new_pakage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'control/autofill.dart';


//final demos = [
  
  
 // Demo(
   // name: '个人信息',
   // route: '/autofill',
   // builder: (context) => AutofillDemo(),
 // ),
 // Demo(
 //   name: '填写清单',
//    route: '/form_widgets',
 //   builder: (context) => FormWidgetsDemo(),
//  ),
  //Demo(
   // name: '查询快递',
   // route: '/validation',
   // builder: (context) => FormValidationDemo(),
 // ),
//];

//class FormApp extends StatelessWidget {
 // @override
//  Widget build(BuildContext context) {
 //   return MaterialApp(
  //    title: '韵达温尼伯旗舰店',
  //    theme: ThemeData(primarySwatch: Colors.deepOrange),
 //     routes: Map.fromEntries(demos.map((d) => MapEntry(d.route, d.builder)),
      //home: HomeView(),
  //    ),
//    );
//  }
//}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('韵达温尼伯旗舰店'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        children:<Widget>[
          
          ListTile(
          leading: Icon(Icons.message),
          title: Text('个人信息'),
          onTap:(){
           Navigator.push(context,MaterialPageRoute(builder: (context)=>AutofillDemo()),);
           },
          ),
          ListTile(
          leading: Icon(Icons.add_box),
          title: Text('新包裹'),
          onTap:(){
           Navigator.push(context,MaterialPageRoute(builder: (context)=>FormWidgetsDemo()),);
           },
          ),
            ListTile(
          // leading: Icon(Icons.add_box),
          // title: Text('查询包裹'),
          // onTap:(){
          //  Navigator.push(context,MaterialPageRoute(builder: (context)=>Searchpackage()),);
          //  },
          ),
          
        ],
      ),
      
    );
  }
}


