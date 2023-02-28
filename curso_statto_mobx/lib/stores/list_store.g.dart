// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _ListStoreBase, Store {
  late final _$newTodoAtom =
      Atom(name: '_ListStoreBase.newTodo', context: context);

  @override
  String get newTodo {
    _$newTodoAtom.reportRead();
    return super.newTodo;
  }

  @override
  set newTodo(String value) {
    _$newTodoAtom.reportWrite(value, super.newTodo, () {
      super.newTodo = value;
    });
  }

  late final _$isDoneAtom =
      Atom(name: '_ListStoreBase.isDone', context: context);

  @override
  bool get isDone {
    _$isDoneAtom.reportRead();
    return super.isDone;
  }

  @override
  set isDone(bool value) {
    _$isDoneAtom.reportWrite(value, super.isDone, () {
      super.isDone = value;
    });
  }

  late final _$todoAtom = Atom(name: '_ListStoreBase.todo', context: context);

  @override
  Todo get todo {
    _$todoAtom.reportRead();
    return super.todo;
  }

  @override
  set todo(Todo value) {
    _$todoAtom.reportWrite(value, super.todo, () {
      super.todo = value;
    });
  }

  late final _$todoListAtom =
      Atom(name: '_ListStoreBase.todoList', context: context);

  @override
  ObservableList<Todo> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<Todo> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  late final _$_ListStoreBaseActionController =
      ActionController(name: '_ListStoreBase', context: context);

  @override
  void setNewTodo(String newTodo) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setNewTodo');
    try {
      return super.setNewTodo(newTodo);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDone() {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setDone');
    try {
      return super.setDone();
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsDone(Todo todo, int index) {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.setIsDone');
    try {
      return super.setIsDone(todo, index);
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo() {
    final _$actionInfo = _$_ListStoreBaseActionController.startAction(
        name: '_ListStoreBase.addTodo');
    try {
      return super.addTodo();
    } finally {
      _$_ListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTodo: ${newTodo},
isDone: ${isDone},
todo: ${todo},
todoList: ${todoList}
    ''';
  }
}
