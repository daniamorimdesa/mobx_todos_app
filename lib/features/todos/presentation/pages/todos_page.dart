// todos_page.dart: página principal da feature de Todos
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_todos/core/theme/theme_store.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/action_bar.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/add_todo.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/description.dart';
import 'package:mobx_todos/features/todos/presentation/widgets/todo_list_view.dart';
import 'package:provider/provider.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = context.read<ThemeStore>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'TODOS',
          style: TextStyle(
            // color: Colors.white, // cor do texto da barra de navegação
            color: Colors.blueGrey,
            fontSize: 24,
            fontWeight: FontWeight.w300,
            letterSpacing: -2,
            fontFamily: 'Montserrat',
          ),
        ),
        // actions: [
        //   Observer(
        //     builder: (_) {
        //       final isDark = themeStore.mode == ThemeMode.dark;
        //       return Padding(
        //         padding: const EdgeInsets.only(right: 24.0),
        //         child: IconButton(
        //           tooltip: isDark ? 'Light Mode' : 'Dark Mode',
        //           onPressed: themeStore.toggle,
        //           icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
        //         ),
        //       );
        //     },
        //   ),
        // ],
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
              SizedBox(height: 22),
              Description(),
              Expanded(child: TodoListView()),
              
            ],
          ),
          
        ),
        
      ),
    );
  }
}
