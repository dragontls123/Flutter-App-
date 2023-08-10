import 'package:flutter/material.dart';
import 'package:flutter_lab/ch06/asset_Widget.dart';
import 'form_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> widgets = [
    AssetWidget(),
    FormWidget(),
  ];

  //tab button click event callback
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //우측 상단의 debug 표시 제거
      //appbar에 이미지 출력하면 안나온다.
      theme: ThemeData(
          primaryColor: Colors.pink,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
          )),
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: Text('Appbar Bottom Text'),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/big.jpeg'),
              fit: BoxFit.fill, //이미지 사이즈와 출력 사이즈가 다를 때 어떻게 나올지 지정
            )),
          ),
          title: Text('Widget Test'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_alarm)),
            IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next))
          ],
        ),
        body: Center(
          child: widgets.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          //fixed - shifting으로 주면 약간의 애니메이션 효과. 눌린 탭에 지정된 칼라가 전체 바 칼라가 된다
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Asset',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Form',
              backgroundColor: Colors.red,
            )
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text('item 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('item 2'),
                onTap: () {},
              ),
              ListTile(
                title: Text('item 3'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
