// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoList on TodoListBase, Store {
  Computed<ObservableList<Todo>>? _$pendingTodosComputed;

  @override
  ObservableList<Todo> get pendingTodos =>
      (_$pendingTodosComputed ??= Computed<ObservableList<Todo>>(
        () => super.pendingTodos,
        name: 'TodoListBase.pendingTodos',
      )).value;
  Computed<ObservableList<Todo>>? _$completedTodosComputed;

  @override
  ObservableList<Todo> get completedTodos =>
      (_$completedTodosComputed ??= Computed<ObservableList<Todo>>(
        () => super.completedTodos,
        name: 'TodoListBase.completedTodos',
      )).value;
  Computed<bool>? _$hasCompletedTodosComputed;

  @override
  bool get hasCompletedTodos => (_$hasCompletedTodosComputed ??= Computed<bool>(
    () => super.hasCompletedTodos,
    name: 'TodoListBase.hasCompletedTodos',
  )).value;
  Computed<bool>? _$hasPendingTodosComputed;

  @override
  bool get hasPendingTodos => (_$hasPendingTodosComputed ??= Computed<bool>(
    () => super.hasPendingTodos,
    name: 'TodoListBase.hasPendingTodos',
  )).value;
  Computed<String>? _$itemDescriptionComputed;

  @override
  String get itemDescription => (_$itemDescriptionComputed ??= Computed<String>(
    () => super.itemDescription,
    name: 'TodoListBase.itemDescription',
  )).value;
  Computed<ObservableList<Todo>>? _$visibleTodosComputed;

  @override
  ObservableList<Todo> get visibleTodos =>
      (_$visibleTodosComputed ??= Computed<ObservableList<Todo>>(
        () => super.visibleTodos,
        name: 'TodoListBase.visibleTodos',
      )).value;
  Computed<bool>? _$canRemoveAllCompletedComputed;

  @override
  bool get canRemoveAllCompleted =>
      (_$canRemoveAllCompletedComputed ??= Computed<bool>(
        () => super.canRemoveAllCompleted,
        name: 'TodoListBase.canRemoveAllCompleted',
      )).value;
  Computed<bool>? _$canMarkAllCompletedComputed;

  @override
  bool get canMarkAllCompleted =>
      (_$canMarkAllCompletedComputed ??= Computed<bool>(
        () => super.canMarkAllCompleted,
        name: 'TodoListBase.canMarkAllCompleted',
      )).value;

  late final _$todosAtom = Atom(name: 'TodoListBase.todos', context: context);

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$filterAtom = Atom(name: 'TodoListBase.filter', context: context);

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$TodoListBaseActionController = ActionController(
    name: 'TodoListBase',
    context: context,
  );

  @override
  void addTodo(String description) {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
      name: 'TodoListBase.addTodo',
    );
    try {
      return super.addTodo(description);
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(Todo todo) {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
      name: 'TodoListBase.removeTodo',
    );
    try {
      return super.removeTodo(todo);
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAllAsCompleted() {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
      name: 'TodoListBase.markAllAsCompleted',
    );
    try {
      return super.markAllAsCompleted();
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCompleted() {
    final _$actionInfo = _$TodoListBaseActionController.startAction(
      name: 'TodoListBase.removeCompleted',
    );
    try {
      return super.removeCompleted();
    } finally {
      _$TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
filter: ${filter},
pendingTodos: ${pendingTodos},
completedTodos: ${completedTodos},
hasCompletedTodos: ${hasCompletedTodos},
hasPendingTodos: ${hasPendingTodos},
itemDescription: ${itemDescription},
visibleTodos: ${visibleTodos},
canRemoveAllCompleted: ${canRemoveAllCompleted},
canMarkAllCompleted: ${canMarkAllCompleted}
    ''';
  }
}
