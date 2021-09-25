// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Taskto on TodoTask, Store {
  final _$TodoListValuesAtom = Atom(name: 'TodoTask.TodoListValues');

  @override
  ObservableList<AbstractDataModel> get TodoListValues {
    _$TodoListValuesAtom.reportRead();
    return super.TodoListValues;
  }

  @override
  set TodoListValues(ObservableList<AbstractDataModel> value) {
    _$TodoListValuesAtom.reportWrite(value, super.TodoListValues, () {
      super.TodoListValues = value;
    });
  }

  final _$TodoListValuesCompletedAtom =
      Atom(name: 'TodoTask.TodoListValuesCompleted');

  @override
  ObservableList<AbstractDataModel> get TodoListValuesCompleted {
    _$TodoListValuesCompletedAtom.reportRead();
    return super.TodoListValuesCompleted;
  }

  @override
  set TodoListValuesCompleted(ObservableList<AbstractDataModel> value) {
    _$TodoListValuesCompletedAtom
        .reportWrite(value, super.TodoListValuesCompleted, () {
      super.TodoListValuesCompleted = value;
    });
  }

  final _$TodoListValuesNonCompletedAtom =
      Atom(name: 'TodoTask.TodoListValuesNonCompleted');

  @override
  ObservableList<AbstractDataModel> get TodoListValuesNonCompleted {
    _$TodoListValuesNonCompletedAtom.reportRead();
    return super.TodoListValuesNonCompleted;
  }

  @override
  set TodoListValuesNonCompleted(ObservableList<AbstractDataModel> value) {
    _$TodoListValuesNonCompletedAtom
        .reportWrite(value, super.TodoListValuesNonCompleted, () {
      super.TodoListValuesNonCompleted = value;
    });
  }

  final _$TodoTaskActionController = ActionController(name: 'TodoTask');

  @override
  void AddTask(dynamic task) {
    final _$actionInfo =
        _$TodoTaskActionController.startAction(name: 'TodoTask.AddTask');
    try {
      return super.AddTask(task);
    } finally {
      _$TodoTaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkBox(dynamic index, dynamic obj) {
    final _$actionInfo =
        _$TodoTaskActionController.startAction(name: 'TodoTask.checkBox');
    try {
      return super.checkBox(index, obj);
    } finally {
      _$TodoTaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  void RemoveCompleted() {
    final _$actionInfo = _$TodoTaskActionController.startAction(
        name: 'TodoTask.RemoveCompleted');
    try {
      return super.RemoveCompleted();
    } finally {
      _$TodoTaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  void MarkAllComplete() {
    final _$actionInfo = _$TodoTaskActionController.startAction(
        name: 'TodoTask.MarkAllComplete');
    try {
      return super.MarkAllComplete();
    } finally {
      _$TodoTaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  void RemoveListItem(dynamic obj) {
    final _$actionInfo =
        _$TodoTaskActionController.startAction(name: 'TodoTask.RemoveListItem');
    try {
      return super.RemoveListItem(obj);
    } finally {
      _$TodoTaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
TodoListValues: ${TodoListValues},
TodoListValuesCompleted: ${TodoListValuesCompleted},
TodoListValuesNonCompleted: ${TodoListValuesNonCompleted}
    ''';
  }
}
