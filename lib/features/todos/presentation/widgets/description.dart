// description.dart: widget que exibe a descrição do número de tarefas pendentes e concluídas
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todos/features/todos/domain/stores/todo_list.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    // obtém a instância de TodoList do provedor
    final list = context.read<TodoList>();

    return Observer(
      // observa mudanças na lista de tarefas
      builder: (_) => Padding(
        // adiciona padding ao redor do texto
        padding: const EdgeInsets.all(8),
        child: Text(
          list.itemDescription,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontFamily: "Montserrat",
          ),
        ),
      ),
    );
  }
}
