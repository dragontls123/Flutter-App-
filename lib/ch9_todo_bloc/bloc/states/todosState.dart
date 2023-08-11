import 'package:flutter/material.dart';

class Todo {
  String title;
  bool completed;
  Todo({required this.title, this.completed = false});

  void toggleComplete(){
    completed = !completed;
  }
}

//bloc 에서 관리하는 상태 데이터..
class TodosState {
  List<Todo> todos;
  TodosState(this.todos);
}
