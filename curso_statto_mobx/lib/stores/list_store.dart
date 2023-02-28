import 'package:curso_statto_mobx/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {

  TextEditingController textEditingController = TextEditingController();

  @observable
  String newTodo = "";

  @action
  void setNewTodo(String newTodo) => this.newTodo = newTodo;

  @observable
  bool isDone = false;

  @action
  void setDone()=> isDone = !isDone;

  @observable
  Todo todo = Todo();

  @action
  void setIsDone(Todo todo, int index) {
    todoList.removeAt(index);
    todo.isDone = !todo.isDone;
    todoList.insert(index ,todo);
  }

  @observable
  ObservableList<Todo> todoList = <Todo>[].asObservable();

  @action
  void addTodo() {
    todoList.add(Todo(title: newTodo));
    
    newTodo = "";
    textEditingController.clear();
  }

}