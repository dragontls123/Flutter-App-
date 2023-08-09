import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//popup menu 구성 문자열..
const List<String> choices = [
  '신고',
  '알림설정',
  '공유하기'
];

class HeaderWidget extends StatelessWidget {
  //popup menu click event....
  void select(String choice){
    Fluttertoast.showToast(
        msg: choice,
        toastLength: Toast.LENGTH_SHORT,//사라지는 시간..  SHORT, LONG
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0//UI 적인 구성은 platform 에 따라 적용 안될 수도 있다..
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('images/lab_instagram_icon_0.jpg'),
        Text('instagram'),
        PopupMenuButton(
            onSelected: select,
            itemBuilder: (BuildContext context){//클릭, 확장 컨텐츠 구성..
              return choices.map<PopupMenuItem<String>>((String choice) {
                return PopupMenuItem<String>(
                  child: Text(choice),
                  value: choice,//선택 이벤트 함수에 전달될 데이터..
                );
              }).toList();
            }
        ),
      ],
    );
  }
}