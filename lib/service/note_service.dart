import 'dart:async';

import 'package:provider_base/config/locator.dart';
import 'package:provider_base/dao/note_dao.dart';
import 'package:provider_base/model/note.dart';

import 'base_service.dart';


class NoteService extends BaseService {

  StreamController<List<Note>> _noteController = new StreamController();

  StreamController<List<Note>> get noteController => _noteController;
  Stream<List<Note>> buildListNoteStream(){
    return null;
  }

  set noteController(StreamController<List<Note>> value) {
    _noteController = value;
  }

  @override
  void init() {
  }

  NoteDao noteDao = locator<NoteDao>();
  Future<List<Note>> getNotesByUserId(int userId) async{
    var result = await noteDao.findByUserId(userId);
    return result;


  }

  addNote(Note note) {
    noteDao.insert(note);
  }

  void removeNote(Note note) {
    noteDao.remove(note);
  }

}
