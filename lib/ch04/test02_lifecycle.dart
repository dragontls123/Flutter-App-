import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ParentWidget());

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentState();
  }

}

class ParentState extends State<ParentWidget> {
  int count = 0;

  void increment() {
    setState() {
      count++;
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('lifeCycle Test'),
            ),
            body: Provider.value(
                value: count,
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('I am Parent Widget'),
                        ElevatedButton(
                            onPressed: increment, child: Text('increment')),
                        ChildWidget(),
                      ],
                    )
                )
            )
        )
    );
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget() {
    print('ChildWidget.. constructor');
  }

  @override
  State<StatefulWidget> createState() {
    return ChildState();
  }

}
//WidgetsBindingObserver - 앱의 활성상태/비활성상태 판단하기 위해서
class ChildState extends State<ChildWidget> with WidgetsBindingObserver {
  int count = 0;

  ChildState() {
    print('ChildState.. constructor');
  }

  @override
  void initState() {
    super.initState();
    print('initState...');
    //자신의 상태 데이터 초기화
    //이벤트 등록.. 위젯에 발생시키는 유저 이벤트는 각 위젯에서 등록
    //이 state가 살아있는 동안 감지해야하는 이벤트
    WidgetsBinding.instance.addObserver(this); //app lifecycle
  }

  @override
  void dispose() {
    super.dispose();
    //state 소멸 직전에 호출
    //마지막 처리 내용.. 이벤트 해제
    WidgetsBinding.instance.removeObserver(this);
  }

  //상위의 위젯 계층이 변경되거나 상위 위젯의 데이터가 변경될 때
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    count = Provider.of<int>(context); //상위에 변경된 데이터 획득
    print('didChangeDependencies..');
  }

  @override
  Widget build(BuildContext context) {
    print('ChildState..build');
    return Text('Child.. $count');
  }

  //State의 함수가 아니라 WidgetsBindingObserver의 함수
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('Current state..$state');
    switch(state){
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      default:
        break;
    }
  }
}
