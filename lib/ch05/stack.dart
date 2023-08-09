import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

//데이터 추상화 VO
class DataVO {
  String image;
  String title;
  String date;
  String content;
  String location;

  DataVO(this.image, this.title, this.date, this.content, this.location);
}

List<DataVO> datas = [
  DataVO('images/lab_lotte_1.jpg', '롯데웨딩위크', '각 지점 본 매장', '2.14(금) ~ 2.23(일)',
      '백화점 전점'),
  DataVO('images/lab_lotte_2.jpg', 'LG TROMM 스타일러', '각 지점 본 매장',
      '2.14(금) ~ 2.29(토)', '백화점 전점'),
  DataVO(
      'images/lab_lotte_3.jpg', '금양와인 페스티발', '본매장', '2.15(토) ~ 2.20(목)', '잠실점'),
  DataVO('images/lab_lotte_4.jpg', '써스데이 아일랜드', '본 매장', '2.17(월) ~ 2.23(일)',
      '잠실점'),
  DataVO('images/lab_lotte_5.jpg', '듀풍클래식', '본 매장', '2.21(금) ~ 3.8(일)', '잠실점'),
];

//Card 한장을 추상화 시킨 위젯...
class CardADWidget extends StatelessWidget {
  DataVO vo;

  CardADWidget(this.vo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.pink,
        ),
        Align(
          alignment: Alignment(0.0, 0.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(vo.image, width: 350,),
                  Container(
                    width: 350,
                    height: 100,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(vo.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text(vo.content),
                        Text(vo.date),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  left: 30,
                  bottom: 90,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black,
                    child: Text(vo.location, style: TextStyle(color: Colors.white),),
                  )
              ),
            ],
          ),
        )
      ],
    );
  }
}

//ViewPage... stateful 로 ...
class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}
class MyWidgetState extends State<MyWidget> {
  List<CardADWidget> makeWidgets() {
    return datas.map((vo){
      return CardADWidget(vo);
    }).toList();
  }
  //ViewPage - 설정.. 제어..
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.9,//현 화면, 왼쪽 오른쪽이 얼마나 나와야 하는지.. 1.0- 안나온다..
  );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //PageView 를 직접 사용해도 되지만..
    //indicator 를 같이 출력하겠다면.. PageIndicatorContainer 로 PageView 를 감싸서..
    return PageIndicatorContainer(
      child: PageView(controller: controller, children: makeWidgets(),),
      length: datas.length,
      indicatorColor: Colors.white,
      indicatorSelectorColor: Colors.blue,
      shape: IndicatorShape.roundRectangleShape(size: Size(20, 3)),
      indicatorSpace: 1,
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.pink,
            child: MyWidget(),
          ),
        ),
      ),
    );
  }
}
