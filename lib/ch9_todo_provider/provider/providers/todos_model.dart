import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/todo.dart';

//Provider 에 등록될 클래스..
class TodosModel extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(Todo todo){
    todos.add(todo);
    notifyListeners();
  }
  void toggleTodo(Todo todo){
    var index = todos.indexOf(todo);
    todos[index].toggleCompleted();
    notifyListeners();
  }
  void deleteTodo(Todo todo){
    todos.remove(todo);
    notifyListeners();
  }
}