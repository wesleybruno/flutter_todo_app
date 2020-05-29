// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangeTheme on _ChangeThemeBase, Store {
  final _$themeAppAtom = Atom(name: '_ChangeThemeBase.themeApp');

  @override
  ThemeData get themeApp {
    _$themeAppAtom.reportRead();
    return super.themeApp;
  }

  @override
  set themeApp(ThemeData value) {
    _$themeAppAtom.reportWrite(value, super.themeApp, () {
      super.themeApp = value;
    });
  }

  final _$actualThemeAtom = Atom(name: '_ChangeThemeBase.actualTheme');

  @override
  String get actualTheme {
    _$actualThemeAtom.reportRead();
    return super.actualTheme;
  }

  @override
  set actualTheme(String value) {
    _$actualThemeAtom.reportWrite(value, super.actualTheme, () {
      super.actualTheme = value;
    });
  }

  final _$isDarkAtom = Atom(name: '_ChangeThemeBase.isDark');

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  final _$loadThemeAsyncAction = AsyncAction('_ChangeThemeBase.loadTheme');

  @override
  Future<void> loadTheme() {
    return _$loadThemeAsyncAction.run(() => super.loadTheme());
  }

  final _$changeThemeAsyncAction = AsyncAction('_ChangeThemeBase.changeTheme');

  @override
  Future<void> changeTheme(String actualTheme) {
    return _$changeThemeAsyncAction.run(() => super.changeTheme(actualTheme));
  }

  @override
  String toString() {
    return '''
themeApp: ${themeApp},
actualTheme: ${actualTheme},
isDark: ${isDark}
    ''';
  }
}
