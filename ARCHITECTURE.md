# MobX Todos - Arquitetura Limpa

Aplicação de exemplo usando Flutter + MobX com arquitetura limpa organizada em features.

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                    # Ponto de entrada da aplicação
│
├── core/                        # Funcionalidades compartilhadas
│   └── di/
│       └── app_providers.dart   # Configuração de injeção de dependências
│
└── features/                    # Features da aplicação
    └── todos/                   # Feature de gerenciamento de tarefas
        ├── domain/              # Regras de negócio e entidades
        │   ├── entities/
        │   │   ├── todo.dart           # Entidade Todo (MobX Store)
        │   │   └── todo.g.dart         # Código gerado MobX
        │   └── stores/
        │       ├── todo_list.dart      # Store da lista de tarefas
        │       └── todo_list.g.dart    # Código gerado MobX
        │
        ├── data/                # Camada de dados
        │   └── converters/
        │       └── observable_todo_list_converter.dart
        │
        └── presentation/        # Interface do usuário
            ├── pages/
            │   └── todos_page.dart     # Página principal
            └── widgets/
                ├── action_bar.dart     # Barra de ações (filtros e botões)
                ├── add_todo.dart       # Campo para adicionar tarefa
                ├── description.dart    # Descrição de tarefas pendentes/concluídas
                └── todo_list_view.dart # Lista de tarefas
```

## 🏗️ Camadas da Arquitetura

### Core
Contém código compartilhado entre features:
- **di/** - Dependency Injection (Provider setup)

### Features/Todos

#### Domain
Lógica de negócio independente de frameworks:
- **entities/** - Entidades de domínio (Todo store com MobX)
- **stores/** - Stores do MobX (TodoList com computeds e actions)

#### Data  
Conversão e persistência de dados:
- **converters/** - Conversores JSON ↔ Observables

#### Presentation
Interface do usuário:
- **pages/** - Telas completas (Scaffold)
- **widgets/** - Componentes reutilizáveis

## 🔄 Gerenciamento de Estado

- **MobX**: Gerenciamento de estado reativo
- **Provider**: Injeção de dependências das stores
- **flutter_mobx**: Observer widgets para rebuild automático

## 🚀 Como Executar

```bash
# Instalar dependências
flutter pub get

# Gerar código MobX (se necessário)
flutter pub run build_runner build --delete-conflicting-outputs

# Executar app
flutter run
```

## 📦 Dependências Principais

- `mobx` - State management
- `flutter_mobx` - Observer widgets
- `mobx_codegen` - Code generation
- `provider` - Dependency injection
