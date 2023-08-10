import 'package:flutter/material.dart';
//import - as ; dart 파일에 선언된 변수, 함수, 클래스를 모두 사용 가능 (underscore 제외)
//그 변수, 함수 클래스를 as 에 선언된 이름으로..
//show, hide - dart 파일에 선언된 것중 원하는 것만 사용(show), 특정 것을 제외하고 (hide)
import 'package:http/http.dart' as http;
import 'dart:convert';

class Article {
  String autor;
  String title;
  String description;
  String urlToImage;
  String publishedAt;

  Article(this.autor, this.title, this.description, this.urlToImage,
      this.publishedAt);
}

Widget getWidget(List<Article> datas) {
  return ListView.builder(
    itemCount: datas.length,
    itemBuilder: (BuildContext context, int position) {
      Column resultWidget=Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text(datas[position].title, style: TextStyle(fontWeight: FontWeight.bold),)
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text(datas[position].publishedAt, style: TextStyle(color: Colors.grey),)
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(datas[position].description, ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Image.network(datas[position].urlToImage),
          ),

        ],
      );
      if(position!=datas.length-1){
        resultWidget.children.add(Container(
            height: 15,
            color: Colors.grey
        ));
      }
      return resultWidget;
    },
  );
}

String _url =
    'https://newsapi.org/v2/everything?q=travel&apiKey=079dac74a5f94ebdb990ecf61c8854b7&pageSize=3';

//네트워킹이 필요할 때 호출되는 함수..
//함수내에서 어떤 작업이 완료될때까지 대기하려면 await,  await 를 사용하려면 함수가 async 로 선언
//async 선언된 함수의 리턴 타입은 Future 가 되어야 한다..
Future<List<Article>> getServerData(String page) async {
  String url = _url+"&page=${page}";
  print('.......... $url');
  http.Response response = await http.get(Uri.parse(url));
  List datas = json.decode(response.body)['articles'];
  List<Article> result = [];
  datas.forEach((element) {
    result.add(Article(
        element['source']['name'],
        element['title'], element['description'], element['urlToImage'], element['publishedAt']
    ));
  });
  return result;
}