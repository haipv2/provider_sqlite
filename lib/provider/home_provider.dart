import 'package:flutter/material.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/dao/note_dao.dart';
import 'package:provider_base/model/note.dart';

class HomeProvider extends ChangeNotifier {
  List<Note> listNote = [];
  final NoteDao noteDao = locator<NoteDao>();

  Stream<List<Note>> listNoteStream() {
    noteDao.findAll();
  }

  addNewNote(Note note) {
    noteDao.insert(note);
    listNote.add(note);
  }
}
