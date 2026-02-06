// todo.dart: store de dados para uma tarefa (to-do) usando MobX
// entidade de domínio que representa uma tarefa individual com descrição e status de conclusão

/*
fromJson é um método estático/factory que cria uma nova instância - 
foi movido para a extension porque não podemos adicionar factory methods 
diretamente em mixin classes (classes definidas com =)

toJson() é um método de instância que converte o objeto atual em JSON -
funciona perfeitamente em TodoBase porque todas as instâncias de Todo 
herdam esse método 
*/

import "package:mobx/mobx.dart";

part "todo.g.dart";

// classe principal que combina a classe gerada com a classe de implementação
// usando mixin do MobX para gerenciamento de estado reativo
class Todo = TodoBase with _$Todo;

// extensão para adicionar funcionalidade de fábrica de JSON à classe Todo
extension TodoFactory on Todo {
  // método estático para criar uma instância de Todo a partir de um mapa JSON
  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      json["description"] as String? ?? '',
      done: json['done'] as bool? ?? false,
    );
  }
}

// classe abstrata que define o estado e as ações do contador de dados
abstract class TodoBase with Store {
  TodoBase(this.description, {this.done = false});

  // observable é usado para marcar variáveis que podem mudar de valor
  // e que queremos observar para atualizações na interface do usuário

  @observable
  String description = ""; // descrição da tarefa

  @observable
  bool done = false; // status de conclusão da tarefa

  // converte o objeto Todo em um mapa JSON
  Map<String, dynamic> toJson() => {'description': description, 'done': done};
}
