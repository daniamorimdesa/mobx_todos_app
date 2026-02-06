import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_todos/features/todos/domain/entities/todo.dart';

class ObservableTodoListConverter
    extends
        JsonConverter<ObservableList<Todo>, Iterable<Map<String, dynamic>>> {
  const ObservableTodoListConverter();

  // Converter de JSON para ObservableList<Todo>
  @override
  ObservableList<Todo> fromJson(Iterable<Map<String, dynamic>> json) =>
      ObservableList.of(json.map(TodoFactory.fromJson));

  // Converter de ObservableList<Todo> para JSON
  @override
  Iterable<Map<String, dynamic>> toJson(ObservableList<Todo> object) =>
      object.map((element) => element.toJson());
}
