// todos_bottom_bar.dart: barra inferior com ações globais
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todos/features/todos/domain/stores/todo_list.dart';
import 'package:provider/provider.dart';

class TodosBottomBar extends StatelessWidget {
  const TodosBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.watch<TodoList>();

    return BottomAppBar(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Observer(
          builder: (_) => Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: list.canRemoveAllCompleted
                      ? list.removeCompleted
                      : null,
                  icon: const Icon(Icons.delete_outline, size: 14),
                  label: const Text(
                    'remove completed',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      letterSpacing: 1,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed:
                      list.canMarkAllCompleted ? list.markAllAsCompleted : null,
                  icon: const Icon(Icons.done_all_rounded, size: 14),
                  label: const Text(
                    'mark all completed',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      letterSpacing: 1,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
