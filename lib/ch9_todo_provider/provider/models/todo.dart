import 'package:flutter/material.dart';

//순수 VO
class Todo {
  String title;
  bool completed;

  //required.. 필수 매개변수..
  //named parameter - 이름 명시..
  Todo({required this.title, this.completed = false});

  void toggleCompleted(){
    completed = !completed;
  }
}