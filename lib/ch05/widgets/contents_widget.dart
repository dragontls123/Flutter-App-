import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget{
  int count = 100;
  String id = 'instagram';
  String content = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세..";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("좋아요 $count"),
        Text.rich(//하나의 텍스트에 나오는 문자열의 일부분의 UI 효과를 다르게 지정
          TextSpan(
            children: [
              TextSpan(text: id, style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: content),

            ]
          )

        ),
      ],
    );
  }
}