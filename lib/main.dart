import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: "Unit Converter",
      home: UnitConverter(),
    ));

class UnitConverter extends StatefulWidget {
  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  final textcontroller = TextEditingController();
  double a = 0.00;
  String b = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit Converter"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  title: TextField(
                    onChanged: (text){
                      b = text;
                    },
                    controller: textcontroller,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                  trailing: Icon(Icons.add_road),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: () {
                    setState(() {
                      a = a+15.00;
                    });
                  },
                ),
                Text('Your input : $b')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
