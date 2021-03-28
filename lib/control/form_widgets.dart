
import 'dart:convert';

import 'package:demo/control/packages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' as intl;
import 'package:http/http.dart'as http;
import 'package:flutter/src/material/input_decorator.dart';


class FormWidgetsDemo extends StatefulWidget {
  @override
  _FormWidgetsDemoState createState() => _FormWidgetsDemoState();
}

class _FormWidgetsDemoState extends State<FormWidgetsDemo> {
  final _formKey = GlobalKey<FormState>();
  // String title = '';
  // String description = '';
  // String number = '';
  double valuenumber = 0 ;
  int countnumber = 0 ;
  String size = '';
  List<String> _list = new List(3);
  List<String> _name = ['名称','单号','描述'];
  
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool brushedTeeth = false;
  bool enableFeature = false;
  var address = 1;
  var current_id = 0;
  // _getdata(){
  //   var apiURl ='';
  //   var result = FontAwesomeIcons.at
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('韵达快递'),
        backgroundColor: Colors.yellow,
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      ...[
                         Column( 
                          children: [
                            
                            Radio(value: 1, groupValue: this.address, onChanged:(v){
                              setState(() {
                                this.address = v;
                              });
                              

                            }),
                            Text('深圳kfkghhweiufiwifuiewfiweiufgweigf'),

                            
                            Radio(value: 2, groupValue: this.address, onChanged:(v){
                              setState(() {
                                this.address = v;
                              });
                           
                            }),
                            Text('广州fhoweuhwokefklewhfweklhfewhfw'),
                            
                          ],

                        ),
                      
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '单号',
                            labelText: '单号',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _list[0] = value;
                              //var a = json.encode(title);
                              //print(a is String);
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '物品链接',
                            labelText: '物品链接',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _list[1] = value;
                              // print();
                            });
                            
                          },
                      
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            filled: true,
                            hintText: '物品描述',
                            labelText: 'Description',
                          ),
                          onChanged: (value) {
                            _list[2] = value;
                          },
                          maxLines: 3,
                        ),
                        _FormDatePicker(
                          date: date,
                          onChanged: (value) {
                            setState(() {
                              date = value;
                            });
                          },
                        ),
                        Container( width: 50,
                          child: Wrap(
                           // mainAxisAlignment: MainAxisAlignment.start,
                           // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                            decoration: InputDecoration(
                              
                              filled: true,
                              hintText: '输入物品名称',
                              labelText: '物品名称',
                            ),
                            onChanged: (value) {
                              setState(() {
                                size = value;
                                //var a = json.encode(title);
                                //print(a is String);
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: '',
                              labelText: '商品价格',
                            ),
                            onChanged: (value) {
                              setState(() {
                                valuenumber = int.parse(value) as double;
                                // print();
                              });
                              
                            },
                      
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              filled: true,
                              hintText: '物品描述',
                              labelText: 'Description',
                            ),
                            onChanged: (value) {
                           setState(() {
                                countnumber = int.parse(value);
                                // print();
                              });}
                          ),
                              
                          //     Row(
                                
                          //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       // children: [
                          //       //   Text(
                          //       //     '包裹价值',
                          //       //     style: Theme.of(context).textTheme.bodyText1,
                          //       //   ),
                          //       // ],
                          //     ),
                          //     Text(
                          //       intl.NumberFormat.currency(
                          //               symbol: "\$", decimalDigits: 0)
                          //           .format(maxValue),
                          //       style: Theme.of(context).textTheme.subtitle1,
                          //     ),
                          //     Slider(
                          //       min: 0,
                          //       max: 500,
                          //       divisions: 500,
                          //       value: maxValue,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           maxValue = value;
                          //         });
                          //       },
                          //     ),
                            ],
                           ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RaisedButton(
                              onPressed:(){ 
                                Map a = _list.asMap();
                                print(a);
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Newpackage()),);
                              },

                             
                             child: new Text('提交'),
                            ),
                            Text('提交',
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text('Enable feature',
                        //         style: Theme.of(context).textTheme.bodyText1),
                        //     Switch(
                        //       value: enableFeature,
                        //       onChanged: (enabled) {
                        //         setState(() {
                        //           enableFeature = enabled;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                      ].expand(
                        (widget) => [
                          widget,
                          SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged onChanged;

  _FormDatePicker({
    this.date,
    this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        TextButton(
          child: Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
