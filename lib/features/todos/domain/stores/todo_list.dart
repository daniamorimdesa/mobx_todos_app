// todo_list.dart: store de dados para a lista de tarefas (to-dos) usando MobX
// gerencia o estado da lista de tarefas, incluindo a adição, remoção e filtragem de tarefas
// store de domínio como use-case para a aplicação, encapsulando a lógica de negócios
//relacionada às tarefas

import "package:mobx/mobx.dart";
import "package:mobx_todos/features/todos/data/datasources/todos_file_storage.dart";
import "package:mobx_todos/features/todos/domain/entities/todo.dart";

part "todo_list.g.dart";

// filtro de visibilidade para tarefas
enum VisibilityFilter { all, pending, completed }

class TodoList = TodoListBase with _$TodoList;

abstract class TodoListBase with Store {
  // ObservableList é uma lista reativa do MobX em que mudanças são observadas e podem disparar atualizações na interface do usuário

  final TodosFileStorage _storage = TodosFileStorage();

  TodoListBase() {
    init();
  }

  // lista observável de tarefas
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  // filtro de visibilidade observável
  @observable
  VisibilityFilter filter = VisibilityFilter.all; // padrão: mostrar todas as tarefas

  @observable
  bool isLoading = true;

  // lista de tarefas pendentes (não concluídas)
  @computed
  ObservableList<Todo> get pendingTodos =>
      ObservableList.of(todos.where((todo) => todo.done != true));

  // lista de tarefas concluídas
  @computed
  ObservableList<Todo> get completedTodos =>
      ObservableList.of(todos.where((todo) => todo.done == true));

  // indica se há tarefas concluídas
  @computed
  bool get hasCompletedTodos => completedTodos.isNotEmpty;

  // indica se há tarefas pendentes
  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  // descrição do item com base no estado atual das tarefas
  @computed
  String get itemDescription {
    // se não houver tarefas, retorna uma mensagem padrão
    if (todos.isEmpty) {
      return "There are no Todos here. Wanna add some? :)";
    }

    // define o sufixo "todo" ou "todos" com base na contagem de tarefas pendentes
    final String suffix;
    if (pendingTodos.length == 1) {
      suffix = "todo";
    } else {
      suffix = "todos";
    }

    // retorna a contagem de tarefas pendentes e concluídas
    // ex: "3 pending todos, 2 completed"
    return "${pendingTodos.length} pending $suffix, ${completedTodos.length} completed";
  }

  // lista de tarefas visíveis com base no filtro atual
  @computed
  ObservableList<Todo> get visibleTodos {
    switch (filter) {
      case VisibilityFilter.pending:
        return pendingTodos;
      case VisibilityFilter.completed:
        return completedTodos;
      default:
        return todos;
    }
  }

  // indica se pode remover todas as tarefas concluídas
  @computed
  bool get canRemoveAllCompleted =>
      hasCompletedTodos && filter != VisibilityFilter.pending;

  // indica se pode marcar todas as tarefas como concluídas
  @computed
  bool get canMarkAllCompleted =>
      hasPendingTodos && filter != VisibilityFilter.completed;

  // ações para modificar o estado da lista de tarefas

  @action
  Future<void> init() async {
    isLoading = true;
    todos = await _storage.loadTodos();
    isLoading = false;
  }

  // persiste a lista de tarefas no armazenamento
  Future<void> _persist() => _storage.saveTodos(todos);

  // adiciona uma nova tarefa com a descrição fornecida
  @action
  Future<void> addTodo(String description) async {
    final todo = Todo(description);
    todos.add(todo);
    await _persist();
  }

  // remove uma tarefa específica
  @action
  Future<void> removeTodo(Todo todo) async {
    todos.remove(todo);
    await _persist();
  }

  // marca todas as tarefas como concluídas
  @action
  Future<void> markAllAsCompleted() async {
    for (final todo in todos) {
      todo.done = true;
    }
    await _persist();
  }

  // remove todas as tarefas concluídas
  @action
  Future<void> removeCompleted() async {
    todos.removeWhere((todo) => todo.done == true);
    await _persist();
  }

  // define o status de conclusão de uma tarefa específica
  @action
  Future<void> setDone(Todo todo, bool value) async {
    todo.done = value;
    await _persist();
  }
}
