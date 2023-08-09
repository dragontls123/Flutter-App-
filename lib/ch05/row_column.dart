import 'package:flutter/material.dart';

// 프로젝트 내의 파일을 package로 import lib부터
import 'package:flutter_lab/ch05/widgets/header_widget.dart'; //절대경로
import 'widgets/icons_widget.dart'; //상대경로..
import 'widgets/ImageWidget.dart';
import 'widgets/contents_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Layout Test'),
      ),
      //스크롤... SingleChildScrollView(하나의 위젯을), ListView(여러 위젯을)
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            IconWidget(),
            ImageWidget(),
            ContentWidget(),
          ],
        ),
      ),
    ));
  }
}
