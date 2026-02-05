// todo.dart: store de dados para uma tarefa (to-do) usando MobX
// entidade de domínio que representa uma tarefa individual com descrição e status de conclusão

import "package:mobx/mobx.dart";

part "todo.g.dart";

// classe principal que combina a classe gerada com a classe de implementação
// usando mixin do MobX para gerenciamento de estado reativo 
class Todo = TodoBase with _$Todo;

// classe abstrata que define o estado e as ações do contador de dados 
abstract class TodoBase with Store {

  TodoBase(this.description);

  // observable é usado para marcar variáveis que podem mudar de valor
  // e que queremos observar para atualizações na interface do usuário

  @observable
  String description = ""; // descrição da tarefa
  
  @observable
  bool done = false; // status de conclusão da tarefa
}
