import 'package:flutter/material.dart';
import 'package:todos/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<ToDo> todos = [];

  List<ToDo> get todolist => todos;

  addTodo(ToDo todo) {
    todos.add(todo);
    notifyListeners();
  }

  removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  toggleIsdone(int index) {
    todolist[index].isDone = !todolist[index].isDone;
    notifyListeners();
  }
  /*List<ToDo> getTodos() {
    List<ToDo> todolist = todos;
    return todolist;
  }*/
}
