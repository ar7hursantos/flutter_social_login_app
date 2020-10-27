// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LogoutStore = BindInject(
  (i) => LogoutStore(i<UserStore>(), i<ILogout>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LogoutStore on _LogoutStoreBase, Store {
  final _$stateAtom = Atom(name: '_LogoutStoreBase.state');

  @override
  LogoutState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LogoutState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_LogoutStoreBaseActionController =
      ActionController(name: '_LogoutStoreBase');

  @override
  LogoutState setState(LogoutState value) {
    final _$actionInfo = _$_LogoutStoreBaseActionController.startAction(
        name: '_LogoutStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_LogoutStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
