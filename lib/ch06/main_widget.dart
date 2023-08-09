import 'package:flutter/material.dart';
import 'package:flutter_lab/ch06/asset_Widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget Test'),
        ),
        body: AssetWidget(),
      ),
    );
  }
}
