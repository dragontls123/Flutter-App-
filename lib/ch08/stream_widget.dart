import 'package:flutter/material.dart';
import 'dart:async';
import 'my_util.dart';

class StreamWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StreamWidgetState();
  }
}

class StreamWidgetState extends State<StreamWidget> {
  List<Article> list = [];
  //Stream 을 이용하면서 꼭 controller 를 사용해야 하는 것은 아니다..
  //controller 에 stream 데이터를 담아주면.. 여러 stream 데이터를 하나로 모아서 처리할때..
  StreamController<List<Article>> streamController = StreamController();

  void getData(int page) async {
    await getServerData(page.toString())
        .then((value) => streamController.add(value));
  }

  int transform(int i){
    int page = ++i;
    getData(page);
    return i;
  }
  periodicStream() async {
    Duration duration = Duration(seconds: 5);
    Stream<int> stream = Stream<int>.periodic(duration, transform);
    stream = stream.take(5);
    await for(int i in stream){
      print("... $i");
    }
  }

  @override
  void initState() {
    super.initState();
    periodicStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: streamController.stream,
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            list.addAll(snapshot.data);
            return getWidget(list);
          }else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        }
    );
  }
}