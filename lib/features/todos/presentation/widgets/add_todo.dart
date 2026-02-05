// add_todo.dart: widget que exibe um campo de texto para adicionar novas tarefas à lista
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todos/core/theme/theme_store.dart';
import 'package:mobx_todos/features/todos/domain/stores/todo_list.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _textController = TextEditingController();

  // libera os recursos do controlador de texto quando o widget é descartado
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // função para submeter o texto e adicionar uma nova tarefa
  void _submit(BuildContext context) {
    final list = context.read<TodoList>();
    final trimmed = _textController.text.trim();
    if (trimmed.isEmpty) return;

    list.addTodo(trimmed);
    _textController.clear();
    FocusScope.of(context).unfocus(); // opcional: fecha teclado após adicionar
  }

  // constrói o widget
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(context),
                decoration: InputDecoration(
                  hintText: 'Add a todo...',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 132, 138, 148),
                    fontFamily: "Montserrat",
                    letterSpacing: 3,
                  ),
                  isDense: true,
                  prefixIcon: const Icon(Icons.add_task_outlined),
                  suffixIcon: IconButton(
                    tooltip: 'Add',
                    onPressed: () => _submit(context),
                    icon: const Icon(Icons.add),
                  ),
                  filled: true,
                  fillColor: const Color(
                    0xFFF2F3F5,
                  ), // cor de fundo do campo de texto
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Observer(
              builder: (_) {
                final themeStore = context.read<ThemeStore>();
                return IconButton(
                  tooltip: 'Toggle Theme',
                  onPressed: themeStore.toggle,
                  icon: Icon(
                    themeStore.mode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
