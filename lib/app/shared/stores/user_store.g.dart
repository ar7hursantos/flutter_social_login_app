// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $UserStore = BindInject(
  (i) => UserStore(i<IUserDatabase>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  final _$currentUserAtom = Atom(name: '_UserStoreBase.currentUser');

  @override
  UserModel get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$getCurrentUserFromDatabaseAsyncAction =
      AsyncAction('_UserStoreBase.getCurrentUserFromDatabase');

  @override
  Future<UserModel> getCurrentUserFromDatabase() {
    return _$getCurrentUserFromDatabaseAsyncAction
        .run(() => super.getCurrentUserFromDatabase());
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
