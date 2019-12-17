import 'package:provider_base/model/user.dart';

import 'base_dao.dart';
import '../config/dbprovider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class UserDao extends BaseDao<User> {
  @override
  Future<List<User>> findAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('USER');
    return List.generate(maps.length, (i) {
      return User(id: maps[i]['id'], name: maps[i]['name']);
    });
  }

  @override
  Future<User> findById(int id) {
    // TODO: implement findById
    return null;
  }

  @override
  void insert(User t) async {
    final db = await database;
    var res = await db.insert('USER', t.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  void update(User t) async {
    final db = await database;
    await db.update(
      'USER',
      t.toMap(),
      where: 'id=?',
      whereArgs: [t.id],
    );
  }
}
