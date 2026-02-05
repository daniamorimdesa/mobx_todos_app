// app_providers.dart: configuração de injeção de dependências usando Provider
import 'package:flutter/material.dart';
import 'package:mobx_todos/core/theme/theme_store.dart';
import 'package:mobx_todos/features/todos/domain/stores/todo_list.dart';
import 'package:provider/provider.dart';

/// Widget que fornece as stores/providers para toda a aplicação
class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // MultiProvider permite fornecer múltiplos providers
      providers: [
        // Provider para a store TodoList (gerenciamento de estado com MobX)
        Provider<TodoList>(
          create: (_) => TodoList(), // cria uma nova instância de TodoList para ser compartilhada em toda a aplicação
        ),
         Provider<ThemeStore>(create: (_) => ThemeStore()),
      ],
      child: child,
    );
  }
}
