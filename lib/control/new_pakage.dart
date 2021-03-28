//  import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart' as intl;
// //import 'package:dio/dio.dart';
// import 'package:http/http.dart'as http;


// class Searchpackage extends StatefulWidget {
//   @override
//   _SearchpackageState createState() => _SearchpackageState();
// }

// class _SearchpackageState extends State<Searchpackage> {
//   List list= [];
//   @override
//   _getData() async{
//     var apiUrl ='';
//     var result = await http.get(apiUrl);
//     if (result.statusCode == 200){
//       print(result.body);
//       setState(() {
//         this.list =json.decode(result.body)['id'];
//       });
//     }else{
//       print('您当前没有包裹在运输');
//     }
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//         title: Text('查询包裹'),
        
//       ),
//       body:this.list.length>0?ListView(
//         children: this.list.map((value){
//           return ListTile(
//             title: Text(value['单号:']),);
//         }).toList(),
//       ):Text('加载中'),
//        //body:childern
//     );
//   }
// }