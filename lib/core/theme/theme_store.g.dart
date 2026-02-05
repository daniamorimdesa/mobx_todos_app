// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on ThemeStoreBase, Store {
  late final _$modeAtom = Atom(name: 'ThemeStoreBase.mode', context: context);

  @override
  ThemeMode get mode {
    _$modeAtom.reportRead();
    return super.mode;
  }

  @override
  set mode(ThemeMode value) {
    _$modeAtom.reportWrite(value, super.mode, () {
      super.mode = value;
    });
  }

  late final _$ThemeStoreBaseActionController = ActionController(
    name: 'ThemeStoreBase',
    context: context,
  );

  @override
  void toggle() {
    final _$actionInfo = _$ThemeStoreBaseActionController.startAction(
      name: 'ThemeStoreBase.toggle',
    );
    try {
      return super.toggle();
    } finally {
      _$ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSystem() {
    final _$actionInfo = _$ThemeStoreBaseActionController.startAction(
      name: 'ThemeStoreBase.setSystem',
    );
    try {
      return super.setSystem();
    } finally {
      _$ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mode: ${mode}
    ''';
  }
}
