// todo_list_view.dart: widget que exibe a lista de tarefas com base no filtro de visibilidade
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todos/features/todos/domain/stores/todo_list.dart';
import 'package:provider/provider.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.read<TodoList>();

    return Observer(
      builder: (_) => ListView.builder(
        itemCount: list.visibleTodos.length,
        itemBuilder: (_, index) {
          final todo = list.visibleTodos[index];
          return Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Material(
                color: const Color.fromARGB(255, 242, 243, 245),
                borderRadius: BorderRadius.circular(14),
                child: ListTile(
                  leading: Checkbox(
                    value: todo.done,
                    onChanged: (v) => todo.done = v ?? false,
                  ),
                  title: Text(
                    todo.description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      decoration: todo.done ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => list.removeTodo(todo),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
