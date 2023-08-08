import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 화면 출력을 위해 자동 호출
  // 이 함수에서 리턴되는 widget부터 그 하위계층의 위젯들이 화면 출력
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // 필수는 아니지만 material design이 적용된 화면 구성을 도와주는 위젯이어서 거의 대부분이 materialApp을 화면 root 위젯으로 사용한다
        // 테마설정 , navigation 처리 등
        home: Scaffold(
      //필수는 아니다. 화면 전체 구조(appbar, drawer, navigation sheet 등)
      appBar: AppBar(
        title: Text('Widget Test'),
      ),
      body: Center(
        child: Column(
          children: [MyStatelessWidget(), MyStatefulWidget()],
        ),
      ),
    ));
  }
}

class MyStatelessWidget extends StatelessWidget {
  // 얼마든지 변수 가질 수 있고, 그 변수 값 변경 가능하다.
  bool favorited = false;
  int favoriteCount = 100;

  // event callback
  void toggleFavorite() {
    print("Stateless ... toggleFavorite ...");
    if (favorited) {
      favoriteCount--;
      favorited = false;
    } else {
      favoriteCount++;
      favorited = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("stateless... build");
    return Row(
      children: [
        IconButton(
            onPressed: toggleFavorite,
            icon: (favorited ? Icon(Icons.star) : Icon(Icons.star_border))),
        Text('$favoriteCount')
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  // Widget과 연결되는 state 객체를 준비하기 위해서 자동 호출
  // 초기 호출.. 이후에는 호출되지 않는다.
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

// generic 으로 어느 위젯이 state인지를 명시해야 함
// 위젯이 다시 생설될 때 연결됨
class MyState extends State<MyStatefulWidget> {
  bool favorited = false;
  int favoriteCount = 100;

  // event callback
  void toggleFavorite() {
    print("Statelful ... toggleFavorite ...");
    //state의 변수가 변경되었다고 화면 re-render되지는 않는다. setState() 함수를 이용해야한다.
    setState(() {
      if (favorited) {
        favoriteCount--;
        favorited = false;
      } else {
        favoriteCount++;
        favorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("stateful... build");
    return Row(
      children: [
        IconButton(
            onPressed: toggleFavorite,
            icon: (favorited ? Icon(Icons.star) : Icon(Icons.star_border))),
        Text('$favoriteCount')
      ],
    );
  }
}
