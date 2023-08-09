import 'package:flutter/material.dart';
import 'dart:convert'; //json
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssetWidget extends StatelessWidget {
  Widget makeTextAsset(context) {
    //asset 파일을 읽어서 화면에 출력할 것임
    //시간이 오래 걸릴 수 있다.
    //미래에 발생하는 데이터를 지칭하는 데이터 타입.. future
    //미래에 발생하는 데이터로 화면을 찍어야 한다. 위젯 있어야 한다. Future를 이용하는
    //FutureBuilder
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/text/my_text.txt'),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Text(
              'asset data : ${snapshot.data}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.red,
                fontSize: 20,
                backgroundColor: Colors.yellow,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            );

          return Text('');
        });
  }

  Widget makeJsonWidget(context) {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/text/data.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //parsing
            var root = json.decode(snapshot.data.toString());
            return Text('Json data : ${root[0]['name']} - ${root[1]['name']}');
          }
          return Text('');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/icon/user.png'),
        makeTextAsset(context),
        makeJsonWidget(context),
        Icon(Icons.menu),
        Icon(FontAwesomeIcons.music, size:10, color:Colors.pink),
        Icon(FontAwesomeIcons.anchor)
      ],
    );
  }
}
