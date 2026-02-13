# 📝 MobX Todos App

![Flutter](https://img.shields.io/badge/Flutter-3.10.7+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.10.7+-0175C2?logo=dart)
![MobX](https://img.shields.io/badge/MobX-2.6.0-orange)
![License](https://img.shields.io/badge/license-MIT-green)

Aplicação de gerenciamento de tarefas (To-Do List) desenvolvida com **Flutter** e **MobX**, seguindo os princípios de **Clean Architecture** e organização por **features**.

## ✨ Características

- ✅ **Adicionar, editar e remover tarefas**
- 🔍 **Filtrar tarefas** (Todas, Pendentes, Concluídas)
- 💾 **Persistência local** de dados em JSON
- 🌙 **Tema claro/escuro** com alternância dinâmica
- ⚡ **Gerenciamento de estado reativo** com MobX
- 🏗️ **Arquitetura limpa** e escalável
- 📱 **Multiplataforma** (Android, iOS, Web, Windows, macOS, Linux)

## 🎯 Funcionalidades

### Gerenciamento de Tarefas
- Adicionar novas tarefas com descrição
- Marcar tarefas como concluídas/pendentes
- Remover tarefas individualmente
- Marcar todas as tarefas como concluídas
- Remover todas as tarefas concluídas de uma vez

### Filtros de Visualização
- **Todas**: Exibe todas as tarefas
- **Pendentes**: Exibe apenas tarefas não concluídas
- **Concluídas**: Exibe apenas tarefas finalizadas

### Persistência de Dados
- Salvamento automático após cada operação
- Carregamento automático ao iniciar o app
- Armazenamento em formato JSON no sistema de arquivos local

## 🏗️ Arquitetura

O projeto segue os princípios de **Clean Architecture** organizada por **features**:

```
lib/
├── main.dart                    # Ponto de entrada
│
├── core/                        # Código compartilhado
│   ├── di/                      # Injeção de dependências
│   │   └── app_providers.dart
│   └── theme/                   # Gerenciamento de tema
│       ├── theme_store.dart
│       └── theme_store.g.dart
│
└── features/                    # Features da aplicação
    └── todos/
        ├── data/                # Camada de dados
        │   ├── converters/
        │   │   └── observable_todo_list_converter.dart
        │   └── datasources/
        │       └── todos_file_storage.dart
        │
        ├── domain/              # Lógica de negócio
        │   ├── entities/
        │   │   ├── todo.dart
        │   │   └── todo.g.dart
        │   └── stores/
        │       ├── todo_list.dart
        │       └── todo_list.g.dart
        │
        └── presentation/        # Interface do usuário
            ├── pages/
            │   └── todos_page.dart
            └── widgets/
                ├── action_bar.dart
                ├── add_todo.dart
                ├── description.dart
                ├── todo_list_view.dart
                └── todos_bottom_bar.dart
```

### Camadas

#### **Core**
Contém funcionalidades compartilhadas entre features:
- **di/**: Configuração de injeção de dependências com Provider
- **theme/**: Store MobX para gerenciamento de tema (claro/escuro)

#### **Data**
Camada de dados e infraestrutura:
- **converters/**: Conversores para serialização JSON com observáveis
- **datasources/**: Implementação de armazenamento em arquivo local

#### **Domain**
Lógica de negócio independente de frameworks:
- **entities/**: Entidade `Todo` como MobX Store
- **stores/**: `TodoList` store com computed values e actions

#### **Presentation**
Interface do usuário:
- **pages/**: Telas completas da aplicação
- **widgets/**: Componentes reutilizáveis (barra de ações, campo de entrada, lista de tarefas)

## 🚀 Tecnologias Utilizadas

- **[Flutter](https://flutter.dev/)** - Framework UI multiplataforma
- **[Dart](https://dart.dev/)** - Linguagem de programação
- **[MobX](https://pub.dev/packages/mobx)** - Gerenciamento de estado reativo
- **[flutter_mobx](https://pub.dev/packages/flutter_mobx)** - Widgets Observer para Flutter
- **[Provider](https://pub.dev/packages/provider)** - Injeção de dependências
- **[path_provider](https://pub.dev/packages/path_provider)** - Acesso a diretórios do sistema
- **[json_annotation](https://pub.dev/packages/json_annotation)** - Anotações para serialização JSON

### Ferramentas de Desenvolvimento

- **[build_runner](https://pub.dev/packages/build_runner)** - Geração de código
- **[mobx_codegen](https://pub.dev/packages/mobx_codegen)** - Geração de código MobX
- **[flutter_lints](https://pub.dev/packages/flutter_lints)** - Regras de linting recomendadas

## 📋 Pré-requisitos

- Flutter SDK 3.10.7 ou superior
- Dart SDK 3.10.7 ou superior
- Android Studio / VS Code (com extensões Flutter)
- Emulador ou dispositivo físico para testes

## 🔧 Instalação e Execução

### 1. Clone o repositório
```bash
git clone <URL_DO_REPOSITORIO>
cd mobx_todos_app
```

### 2. Instale as dependências
```bash
flutter pub get
```

### 3. Gere o código do MobX
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Execute o aplicativo
```bash
flutter run
```

Para executar em uma plataforma específica:
```bash
flutter run -d chrome          # Web
flutter run -d windows         # Windows
flutter run -d macos           # macOS
flutter run -d linux           # Linux
flutter run -d <device_id>     # Android/iOS
```

## 🔄 Geração de Código

O projeto utiliza **code generation** do MobX. Sempre que modificar arquivos com anotações `@observable`, `@computed` ou `@action`, execute:

```bash
# Gerar código uma vez
flutter pub run build_runner build --delete-conflicting-outputs

# Ou executar em modo watch (regenera automaticamente após mudanças)
flutter pub run build_runner watch --delete-conflicting-outputs
```

## 🧪 Testes

```bash
# Executar todos os testes
flutter test

# Executar testes com coverage
flutter test --coverage
```

## 📱 Ícone do App

O ícone do aplicativo está localizado em `assets/logos/logo-todos.png` e é configurado automaticamente para Android e iOS usando o pacote `flutter_launcher_icons`.

Para regenerar os ícones:
```bash
flutter pub run flutter_launcher_icons
```
