import 'package:flutter/material.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/model/note.dart';
import 'package:provider_base/service/base_service.dart';
import 'package:provider_base/service/note_service.dart';
import '../enums/view_state.dart';

class BaseModel extends ChangeNotifier {

    final NoteService noteService = locator<NoteService>();

    ViewState _state = ViewState.done;
    ViewState get state => _state;

    void setState (ViewState state) {
      _state = state;
      notifyListeners();
    }

    List<Note> getNotesByUserId({int userId}){
      setState(ViewState.loading);
      List<Note> result = noteService.getAllNotes(userId);
      setState(ViewState.done);
      return result;
    }
}