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
        child: Column(
          children: [
            Observer(
              builder: (_) {
                final selections = VisibilityFilter.values
                    .map((f) => f == list.filter)
                    .toList(growable: false);

                return Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: SegmentedButton<VisibilityFilter>(
                    segments: const [
                      ButtonSegment(
                        value: VisibilityFilter.all,
                        label: Text(
                          'ALL',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                      ButtonSegment(
                        value: VisibilityFilter.pending,
                        label: Text(
                          'PENDING',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                      ButtonSegment(
                        value: VisibilityFilter.completed,
                        label: Text(
                          'COMPLETED',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ],
                    selected: {list.filter},
                    onSelectionChanged: (set) => list.filter = set.first,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Observer(
              builder: (_) => OverflowBar(
                spacing: 8,
                alignment: MainAxisAlignment.center,
                overflowAlignment: OverflowBarAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: list.canRemoveAllCompleted
                        ? list.removeCompleted
                        : null,
                    child: const Text(
                      'remove completed',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                        letterSpacing: 1,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  OutlinedButton(
                    onPressed: list.canMarkAllCompleted
                        ? list.markAllAsCompleted
                        : null,
                    child: const Text(
                      'mark all completed',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                        letterSpacing: 1,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
