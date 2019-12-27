import 'package:provider_base/model/note.dart';
import 'package:sqflite/sqflite.dart';

import 'base_dao.dart';

class NoteDao extends BaseDao {
  @override
  Future<List> findAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('NOTE');
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        content: maps[i]['content'],
      );
    });
  }

  Future<List<Note>> findByUserId(int userId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('NOTE');
    List<Note> result = List.generate(maps.length, (i) {
      return Note(id: maps[i]['id'], content: maps[i]['content']);
    });
    return result;
  }

  @override
  Future findById(int id) {
    // TODO: implement findById
    return null;
  }

  @override
  void insert(note) async {
    final db = await database;
    await db.insert(
      'NOTE',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  void update(t) {
    // TODO: implement update
  }

  void remove(Note note) async {
    final db = await database;
    await db.delete('NOTE', where: "id = ?", whereArgs: [note.id]);
  }
}
