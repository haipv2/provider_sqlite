import 'package:flutter/material.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/model/note.dart';
import 'package:provider_base/service/base_service.dart';
import 'package:provider_base/service/note_service.dart';
import '../enums/view_state.dart';

class BaseModel extends ChangeNotifier {

    final NoteService noteService = locator<NoteService>();

    ViewState _state = ViewState.loading;
    ViewState get state => _state;

    void setState (ViewState state) {
      _state = state;
      notifyListeners();
    }

    List<Note> getNotesByUserId({int userId}){
      setState(ViewState.loading);
      Future.delayed(Duration(milliseconds: 2000));
      List<Note> result = noteService.getNotesByUserId(userId);
      setState(ViewState.done);
      return result;
    }
}