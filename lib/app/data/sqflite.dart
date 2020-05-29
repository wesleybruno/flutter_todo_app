import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqFlite {
  Future<String> getPath() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = "${documentsDirectory.path}/todo.db";
    return path;
  }

  Future<Database> getConnection() async {
    var path = await getPath();
    return openDatabase(
      path,
      version: 1,
      onUpgrade: (db, version, info) async {},
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE Task (id integer primary key autoincrement, titulo TEXT, descricao TEXT, isExecutada TEXT)",
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> read(
    String table,
    List<String> columns,
    String where,
    List<String> whereArgs,
  ) async {
    try {
      var conn = await getConnection();

      var rs = await conn.query(
        "$table",
        columns: columns,
        where: where,
        whereArgs: whereArgs,
      );

      conn.close();

      return rs;
    } catch (e) {
      //debugPrint(e.message);
    }
  }

  Future<bool> insert(String insertString, List<String> insertValues) async {
    try {
      var conn = await getConnection();

      await conn.rawInsert(
        insertString,
        insertValues,
      );

      conn.close();

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(int key, String query) async {
    try {
      var conn = await getConnection();

      await conn.rawDelete(query, ["$key"]);

      conn.close();

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update(
    String table,
    Map<String, dynamic> values,
    String where,
    List<String> whereArgs,
  ) async {
    try {
      var conn = await getConnection();

      await conn.update(table, values, where: where, whereArgs: whereArgs);

      conn.close();
      return true;
    } catch (e) {
      return false;
    }
  }
}
