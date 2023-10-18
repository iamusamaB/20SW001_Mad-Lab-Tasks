import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class TdoProvider extends ChangeNotifier {
  List<Todo> todos = [];

  //arrow code of geter method in one line
  List<Todo> get todolist => todos;

  addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  toggleIsdone(int index) {
    todos[index].isDone = !todos[index].isDone;
    notifyListeners();
  }

//geter method used to get the value using the full implementation

  // List<Todo> getTodos(){
  //   List<Todo> todolist = todos;
  //   return todolist;
  // }
}

class Todo {
  String name;
  bool isDone;
  Todo({required this.name, required this.isDone});
}
