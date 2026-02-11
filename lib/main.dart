import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'core/di/app_providers.dart';
import 'core/theme/theme_store.dart';
import 'features/todos/presentation/pages/todos_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: Observer(
        builder: (context) {
          final themeStore = context.read<ThemeStore>();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MobX Todos',
            themeMode: themeStore.mode,

            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
              scaffoldBackgroundColor: const Color(0xFFF6F7F9),
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black87,
              ),
            ),

            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 173, 240, 240),
                brightness: Brightness.dark,
              ),
              scaffoldBackgroundColor: const Color(0xFF0B1220),
              appBarTheme: const AppBarTheme( // cor da barra de navegação
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent, // cor da barra de navegação
                foregroundColor: Color.fromARGB(255, 255, 255, 255), // cor do texto da barra de navegação
              ),

              bottomAppBarTheme: const BottomAppBarThemeData(
                color: Color.fromARGB(255, 22, 22, 32), // mesma cor dos cards
                elevation: 0,
              ),

              // ============================
              // importante: Cards devem usar surface / surfaceVariant escuros
              // ============================
              cardTheme: CardThemeData(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                margin: const EdgeInsets.all(0),
                color: const Color.fromARGB(255, 26, 39, 58),
              ),
              // ============================
              // texto: use onSurface em tons suaves
              // ============================
              textTheme: Typography.blackMountainView.copyWith(
                bodyLarge: TextStyle(color: Colors.white70),
                bodyMedium: TextStyle(color: Colors.white60),
                titleMedium: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  letterSpacing: 1,
                ),
              ),
              // ============================
              // ListTiles / ListView items
              // ============================
              listTileTheme: ListTileThemeData(
                tileColor: const Color.fromARGB(255, 6, 10, 17), // garante fundo do item
                iconColor: Colors.white70,
                textColor: Colors.white70,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // ============================
              // Checkbox: cor do ícone e do background
              // ============================
              checkboxTheme: CheckboxThemeData(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected))
                    return Colors.blueGrey;
                  return Colors.white30;
                }),
                checkColor: MaterialStateProperty.all(Colors.black87),
              ),

              // ============================
              // InputDecoration: TextField / AddTodo
              // ============================
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: const Color(0xFF0F1930), 
                hintStyle: TextStyle(color: Colors.white54, fontFamily: "Montserrat", letterSpacing: 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              
              // Cor do texto digitado nos TextFields
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.white,
              ),

              // icon default
              iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
            ),

            home: const TodosPage(),
          );
        },
      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:mobx_todos/core/di/app_providers.dart';
// import 'package:mobx_todos/features/todos/presentation/pages/todos_page.dart';
// import 'package:window_manager/window_manager.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   // Configuração da janela (apenas para desktop)
//   await windowManager.ensureInitialized();
  
//   const windowOptions = WindowOptions(
//     size: Size(450, 900),
//     minimumSize: Size(450, 900),
//     maximumSize: Size(450, 900), // Fixar tamanho
//     center: true,
//     backgroundColor: Colors.transparent,
//     skipTaskbar: false,
//     titleBarStyle: TitleBarStyle.normal,
//   );
  
//   await windowManager.waitUntilReadyToShow(windowOptions, () async {
//     await windowManager.show();
//     await windowManager.focus();
//   });
  
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppProviders(
//       child: MaterialApp(
//   debugShowCheckedModeBanner: false,
//   title: 'MobX Todos',

//   themeMode: ThemeMode.system, // system / light / dark

//   theme: ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.light,
//     colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
//     scaffoldBackgroundColor: const Color(0xFFF6F7F9),
//     appBarTheme: const AppBarTheme(
//       centerTitle: true,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       foregroundColor: Colors.black87,
//     ),
//   ),

//   darkTheme: ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.dark,
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: Colors.cyanAccent,
//       brightness: Brightness.dark,
//     ),
//     scaffoldBackgroundColor: const Color(0xFF0B1220),
//     appBarTheme: const AppBarTheme(
//       centerTitle: true,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       foregroundColor: Colors.white,
//     ),
//   ),

//   home: const TodosPage(),
// ),

//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'MobX Todos',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
//           useMaterial3: true,
//           brightness: Brightness.light,
//           //scaffoldBackgroundColor: const Color.fromARGB(255, 36, 44, 59),
//         ),
//         home: const TodosPage(),
//       ),
//     );
//   }
// }
