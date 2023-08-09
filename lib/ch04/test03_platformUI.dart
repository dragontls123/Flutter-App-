import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() => runApp(MyApp());
//flutter는 ui를 위해 native 와 연동하지 않는다.
//직접 화면을 skio 로 그림으로, platform별로 상이하지 않다
//MaterialApp을 이용할 것을 권장하고 있다 => android app 스타일
//만약 platform 별로 상이한 ui를 구성하고 싶다면 가능
class MyApp extends StatelessWidget {
  Widget platformUI(){
    if(Platform.isIOS){
      return CupertinoApp(
        title: 'Cupertino',
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: Scaffold(
          appBar: CupertinoNavigationBar(
            middle : Text('Cupertino Style UI',style: TextStyle(color:Colors.black),)
          ),
          body : Center(
            child:Text('Hello World')
          )
        )
      );
    }
      else{
        return MaterialApp(
          //SafeArea -  디바이스의 특성에 의해 화면 출력이 정상적이지 않을 수 있다.
          //라운드 처리된 디바이스 , 노치 등
          //디바이스 상황을 고려해서 화면의 컨텐츠를 보호해서 출력하기 위한 위젯
          home : SafeArea(
              child: Scaffold(
                appBar: AppBar(title: Text('Material Style UI')),
                body: Center(
                  child: Text('Hello World'),
                ),
              )
          )
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return platformUI();
  }
}
