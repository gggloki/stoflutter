import 'package:editable/editable.dart';
import 'package:flutter/material.dart';

import 'form_widgets.dart';

class Newpackage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '填入新单',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '包裹添加'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  List packageinfo = new List();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Create a Key for EditableState
   final _editableKey = GlobalKey<EditableState>();

  List rows =[];
  
  List cols = [
    {"title": '物品名称', 'widthFactor': 0.333, 'key': '物品名称', },
    {"title": '单价', 'widthFactor': 0.333, 'key': '单价'},
    {"title": '数量', 'widthFactor': 0.2, 'key': '数量'},
  ];

  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {
    setState(() {
      _editableKey.currentState.createRow();
    });
  }

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState.editedRows;
    print(editedRows);
    //setState(() {
     // print(rows);
    //});
  }
   List _saveEditedRow(){
    List a = _editableKey.currentState.editedRows;
    //print(a);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 400,
        leading: TextButton.icon(
            onPressed: () => _addNewRow(),
            icon: Icon(Icons.add),
            label: Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => _printEditedRows(),
                child: Text('Print Edited Rows',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: Editable(
  
        
        key: _editableKey,
        columns: cols,
        
        rows: rows,
        zebraStripe: true,
        stripeColor1: Colors.blue[50],
        stripeColor2: Colors.grey[200],
        
        onSubmitted: (rows) {
          print(rows);
        },
        onRowSaved: (rows) {
          print(rows);
          
        },
        borderColor: Colors.blueGrey,
        tdStyle: TextStyle(fontWeight: FontWeight.bold),
        trHeight: 80,
        thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        thAlignment: TextAlign.center,
        thVertAlignment: CrossAxisAlignment.end,
        thPaddingBottom: 3,
        showSaveIcon: true,
        saveIconColor: Colors.black,
        showCreateButton: true,
        tdAlignment: TextAlign.center,
        tdEditableMaxLines: 100, // don't limit and allow data to wrap
        tdPaddingTop: 0,
        tdPaddingBottom: 14,
        tdPaddingLeft: 8,
        tdPaddingRight: 8,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(0))),

      ),
      floatingActionButton: Container(
      child:ElevatedButton(onPressed: 
        (){
          List packageinfo = _saveEditedRow();
          Navigator.push(context,MaterialPageRoute(builder: (context)=>FormWidgetsDemo()),);
          rows = _editableKey.currentState.editedRows;
        },
        child : Text('提交成功'),
        ),
         
        ),
        
        

      

    );
  }
}

