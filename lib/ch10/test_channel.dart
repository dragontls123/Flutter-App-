import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Channel',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NativeCallWidget(),
    );
  }
}

class NativeCallWidget extends StatefulWidget {
  @override
  NativeCallWidgetState createState() => NativeCallWidgetState();
}

class NativeCallWidgetState extends State<NativeCallWidget> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Channel Test")),
        body: Center(
          child: Column(
            children: (<Widget>[
              
            ]),
          ),
        )
    );
  }
}
