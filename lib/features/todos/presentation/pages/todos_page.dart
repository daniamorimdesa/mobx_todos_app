// todos_page.dart: página principal da feature de Todos
import 'package:flutter/material.dart';
import 'package:mobx_todos/core/theme/theme_store.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/action_bar.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/add_todo.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/description.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/todo_list_view.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/todos_bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = context.read<ThemeStore>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'TO',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 24,
                fontWeight: FontWeight.w300,
                letterSpacing: -2,
                fontFamily: 'Montserrat',
              ),
            ),

            Transform.translate(
              offset: const Offset(-8, 1), // ajuste fino aqui
              child: SvgPicture.asset(
                'assets/logos/black-evil-cat-svgrepo-com.svg',
                height: 26,
                colorFilter: const ColorFilter.mode(
                  Colors.blueGrey,
                  BlendMode.srcIn,
                ),
              ),
            ),

            Transform.translate(
              offset: const Offset(-16, 8), // ajuste fino aqui
              child: const Text(
                'DOS',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -2,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Column(
            children: const [
              SizedBox(height: 2),
              AddTodo(),
              SizedBox(height: 6),
              ActionBar(),
              SizedBox(height: 12),
              Description(),
              Expanded(child: TodoListView()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const TodosBottomBar(),
    );
  }
}
