// todos_file_storage.dart: implementação de armazenamento de dados em arquivo para tarefas (to-dos)
import 'dart:convert';
import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:mobx_todos/features/todos/data/converters/observable_todo_list_converter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobx_todos/features/todos/domain/entities/todo.dart';

/*
métodos para carregar e salvar uma lista observável de tarefas (to-dos)
- Future<File> _getFile(): obtém o arquivo onde os to-dos serão armazenados
- Future<ObservableList<Todo>> loadTodos(): carrega a lista de to-dos do arquivo
- Future<void> saveTodos(ObservableList<Todo> todos): salva a lista de to-dos no arquivo
*/

class TodosFileStorage {
  static const _fileName =
      'todos.json'; // nome do arquivo onde os to-dos serão armazenados
  final _converter =
      const ObservableTodoListConverter(); // conversor para serializar/deserializar a lista de to-dos

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}${Platform.pathSeparator}$_fileName');
  }

  Future<ObservableList<Todo>> loadTodos() async {
    try {
      final file = await _getFile();
      if (!await file.exists()) return ObservableList<Todo>();

      final content = await file.readAsString();
      if (content.trim().isEmpty) return ObservableList<Todo>();

      final decoded = jsonDecode(content);

      // formato esperado: List<Map<String,dynamic>>
      final list = (decoded as List).cast<Map<String, dynamic>>();
      return _converter.fromJson(list);
    } catch (_) {
      // se der erro de parse, retorna vazio (pode logar depois)
      return ObservableList<Todo>();
    }
  }

  Future<void> saveTodos(ObservableList<Todo> todos) async {
    final file = await _getFile();

    final jsonList = _converter.toJson(todos).toList();
    final content = const JsonEncoder.withIndent('  ').convert(jsonList);

    await file.writeAsString(content, flush: true);
  }
}
