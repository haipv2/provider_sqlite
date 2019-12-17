import 'package:provider_base/model/note.dart';

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
    Future.delayed(Duration(milliseconds: 2000));
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('NOTE');
    return List.generate(maps.length, (i) {
      return Note(id: maps[i]['id'], content: maps[i]['content']);
    });
  }

  @override
  Future findById(int id) {
    // TODO: implement findById
    return null;
  }

  @override
  void insert(t) {
    // TODO: implement insert
  }

  @override
  void update(t) {
    // TODO: implement update
  }
}
