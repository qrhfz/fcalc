import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> init() async {
  // Init ffi loader if needed.
  sqfliteFfiInit();
  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
  await db
      .execute('CREATE TABLE IF NOT EXISTS init_script (text TEXT NOT NULL);');
  await db.execute('''
    INSERT INTO init_script (text) 
    SELECT ''
    WHERE NOT EXISTS (SELECT * FROM init_script);
  ''');

  return db;
}

final dbProv = Provider<Database>((ref) {
  throw UnimplementedError();
});
