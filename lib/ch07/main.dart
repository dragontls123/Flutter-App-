import 'package:flutter/material.dart';
import 'four_screen.dart';
import 'one_screen.dart';
import 'three_screen.dart';
import 'two_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one': (context) => OneScreen(),
        '/two': (context) => TwoScreen(),
      },
      onGenerateRoute: (settings){//settings 는 어디선가 전달한 routing 정보..
        if(settings.name == '/three'){
          //B/L 실행...
          return MaterialPageRoute(
              builder: (context) => ThreeScreen(),
              settings: settings//자신이 받은 settings 를 그대로 전달.. 그래야 명령내린곳의
            //데이터가 그대로 전달..
          );
        }else if(settings.name == '/four'){
          return MaterialPageRoute(
              builder: (context) => FourScreen(),
              settings: settings
          );
        }
      },
    );
  }
}