import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Unit Converter",
      home: UnitConverter(),
    ));

class UnitConverter extends StatefulWidget {
  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  final textcontroller = TextEditingController();

  String drdownvalue = "";
  var textfieldvalue = "";
  var units = ['Meter to Centimeter','Centimeter to Meter'];
  String flag = "";
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit Converter"),
      ),
      body: Container(
        color: Colors.black12,
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.00),
          child: Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  title: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter here'
                    ),
                    onChanged: (text){
                      textfieldvalue = text;
                    },
                  ),
                ),
                DropdownButton<String>(
                  items: units.map((String dropDownStringItem){
                    return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String itemvalue){
                    setState(() {
                      drdownvalue = itemvalue;
                    });
                  },
                    hint: Text('Select'),

                ),
                IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: (){
                      setState(() {
                            if(drdownvalue=="Meter to Centimeter"){
                              result = metertocenti();
                              flag = "cm";
                            }
                            if(drdownvalue=="Centimeter to Meter"){
                              result = centitometer();
                              flag = "m";
                            }

                      });
                    }),
                Text(' $result  $flag ')
              ],
            ),
          ),
        ),

      ),
    );
  }

  double metertocenti() {
    double inf;
    inf = double.parse(textfieldvalue);
    double fin = (inf*100);
    return fin;
  }
  double centitometer() {
    double inf;
    inf = double.parse(textfieldvalue);
    double fin = inf/100;
    return fin;
  }
}
