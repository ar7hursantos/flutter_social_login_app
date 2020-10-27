// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_app_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DrawerAppStore = BindInject(
  (i) => DrawerAppStore(i<LogoutStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerAppStore on _DrawerAppStoreBase, Store {
  final _$stateAtom = Atom(name: '_DrawerAppStoreBase.state');

  @override
  DrawerAppState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(DrawerAppState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_DrawerAppStoreBaseActionController =
      ActionController(name: '_DrawerAppStoreBase');

  @override
  DrawerAppState setState(DrawerAppState value) {
    final _$actionInfo = _$_DrawerAppStoreBaseActionController.startAction(
        name: '_DrawerAppStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_DrawerAppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
