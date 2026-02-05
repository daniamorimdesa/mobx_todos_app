import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'theme_store.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {

  // modo de tema observável (claro, escuro ou sistema)
  @observable
  ThemeMode mode = ThemeMode.light; // com valor padrão light

  // alterna entre os modos claro e escuro
  @action
  void toggle() {
    mode = (mode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
  }

  // define o modo claro
  @action
  void setSystem() {
    mode = ThemeMode.system;
  }
}
