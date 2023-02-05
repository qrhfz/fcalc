import 'package:fcalc/db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

class InitScriptService {
  final Database db;
  static const String table = 'init_script';

  InitScriptService(this.db);

  Future<void> save(String script) async {
    await db.update(
      table,
      {
        'text': script,
      },
      where: 'ROWID = ?',
      whereArgs: [1],
    );
  }

  Future<String> read() async {
    final result = await db.query(table);
    assert(result.length == 1);
    final script = result[0]['text'];
    if (script is String) {
      return script;
    }

    throw "not string";
  }
}

final initScriptServiceProv = Provider((ref) {
  final db = ref.watch(dbProv);
  return InitScriptService(db);
});
