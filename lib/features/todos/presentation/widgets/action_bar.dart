// action_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todos/features/todos/domain/stores/todo_list.dart';
import 'package:provider/provider.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.read<TodoList>();

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ), // bordas arredondadas do card
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Observer(
          builder: (_) {
            return SizedBox(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => list.filter = VisibilityFilter.all,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: list.filter == VisibilityFilter.all
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                      ),
                      child: const Text(
                        'ALL',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          letterSpacing: -1,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => list.filter = VisibilityFilter.pending,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: list.filter == VisibilityFilter.pending
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        'PENDING',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          letterSpacing: -1,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => list.filter = VisibilityFilter.completed,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: list.filter == VisibilityFilter.completed
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                      ),
                      child: const Text(
                        'COMPLETED',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          letterSpacing: -1,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
