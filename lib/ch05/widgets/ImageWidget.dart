import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/lab_instagram.jpg',
      width: double.infinity, // 가로방향 디바이스 사이즈 전체
    );
  }
}
