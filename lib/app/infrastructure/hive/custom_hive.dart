import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

const String _subDirectoryPath = 'hive_db';

enum HiveBox {
  userBox,
  schoolSubjectBox,
  virtualClassRequestOrderBox,
  virtualClassAcceptanceOrderStatusBox,
  virtualClassLessonBox,
}

Future<Directory> _getHiveDatabaseDir() async {
  var appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  return Directory('${appDocumentDir.path}/$_subDirectoryPath');
}

Future<void> initHiveDB() async {
  var hiveDatabaseDir = await _getHiveDatabaseDir();
  Hive.init(hiveDatabaseDir.path);
}

Future<void> clearHiveDB() async {
  for (var enumValue in HiveBox.values) {
    var box = await Hive.openBox(enumValue.toString());
    await box.clear();
  }
}

Future<void> destroyHiveDB() async {
  var hiveDatabaseDir = await _getHiveDatabaseDir();
  hiveDatabaseDir.delete(recursive: true);
}
