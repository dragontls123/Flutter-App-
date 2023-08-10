import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IsolateScreen(),
    );
  }
}

class IsolateScreen extends StatefulWidget {
  @override
  IsolateScreenState createState() => IsolateScreenState();
}

class IsolateScreenState extends State<IsolateScreen> {

  //필수는 아니지만.. ListView 에 등록..
  //ListView 의 유저 스크롤 정보가 controller 에 전달..
  //controller event handler 등록해서.. 스크롤 정보 발생시.. 이벤트 핸들링.. 마지막인지 판달 할려고
  ScrollController controller = ScrollController();

  List datas = [];//ListView 를 구성하기 위한 데이터.. 초기는 없다.. 네트워킹에 의해 추가될 거다..

  //서버에 넘길 데이터..
  int page = 1;
  int seed = 1;

  //isolate 에 의해 실행될 업무 함수.. 네트워킹....
  static dataLoader(SendPort sendPort) async {
    //main 에서 전달하는 데이터를 받기 위해서..
    ReceivePort port = ReceivePort();
    sendPort.send(port.sendPort);

    await for(var msg in port){//main 에서 데이터가 넘어온다면..
      //네트워킹을 위한 정보 획득하고..,.
      String url = msg[0];
      SendPort replyTo = msg[1];

      //네트워킹 시도..
      http.Response response = await http.get(Uri.parse(url));
      //main 에 전달..
      replyTo.send(json.decode(response.body));
    }
  }

  //main isolate 에 의해 실행.. isolate 를 만들어 networking 되게하는 함수..
  //네트워킹이 여러곳에서 필요함으로.. 공통코드..
  Future<List> getServerData() async {
    String url = "https://randomuser.me/api/?seed=${seed}&page=${page}&results=20";
    print(url);
    ReceivePort receivePort = ReceivePort();
    Isolate.spawn(dataLoader, receivePort.sendPort);

    SendPort sendPort = await receivePort.first;
    ReceivePort response = ReceivePort();
    sendPort.send([url, response.sendPort]);
    Map<String, dynamic> result = await response.first;
    return result['results'];//results 는 서버 json 데이터 key
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListener);//스크롤 이벤트 핸들러 등록..
    getServerData().then((value) {//서버 연동하고.. 넘어온 데이터를 List 에 대입, 화면  re-render
      setState(() {
        datas=value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  //ListView refresh 상황에서 호출...
  Future<List<dynamic>> refresh() async {
    page = 1;
    seed++;
    List result = await getServerData();
    setState(() {
      datas = result;
    });
    return result;
  }

  scrollListener() async {
    //스크롤 이벤트가 발생했을 때 호출..
    //마지막까지 스크롤 된것인지를 판단..
    //마지막이 아니라 특정 item 까지 스크롤 된 것인지를 판단하려면 외부 라이브러리 사용해야..
    if(controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange){
      page++;
      List result = await getServerData();
      setState(() {
        datas.addAll(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isolate Example'),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.separated(
            controller: controller,
            itemBuilder: (context, position){//항목 구성..
              return ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text("${datas[position]['name']['first']} ${datas[position]['name']['last']}"),
                subtitle: Text(datas[position]['email']),
                leading: CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child: Image.network(datas[position]['picture']['thumbnail']),
                  ),
                ),
              );
            },
            separatorBuilder: (content, position){
              return Divider(color: Colors.black,);
            },
            itemCount: datas.length
        ),
      ),
    );
  }
}