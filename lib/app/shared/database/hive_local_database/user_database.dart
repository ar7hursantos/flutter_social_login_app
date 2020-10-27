import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import '../../../infrastructure/hive/custom_hive.dart';
import '../../models/user_model.dart';
import '../interfaces/i_user_database.dart';

part 'user_database.g.dart';

@Injectable()
class UserDatabase extends Disposable implements IUserDatabase {
  final Dio dio;
  final Completer completer = Completer<Box>();
  final String boxName = HiveBox.userBox.toString();

  UserDatabase(this.dio) {
    _initDb();
  }

  _initDb() async {
    final box = await Hive.openBox(boxName);
    if (!completer.isCompleted) completer.complete(box);
  }

  @override
  Future<UserModel> add(UserModel model) async {
    final box = await completer.future;
    box.put(model.id, model.toJson());

    return model;
  }

  @override
  Future<UserModel> getCurrent() async {
    final box = await completer.future;
    return box.values.length > 0 ? UserModel.fromJson(box.values.first) : null;
  }

  @override
  Future<void> update(UserModel model) async {
    final box = await completer.future;
    box.put(model.id, model.toJson());
  }

  @override
  Future<void> remove(int id) async {
    final box = await completer.future;
    await box.delete(id);
  }

  @override
  Future<void> clear() async {
    final box = await completer.future;
    await box.clear();
  }

  @override
  Future<void> dispose() async {
    final box = await completer.future;
    box.close();
  }
}
