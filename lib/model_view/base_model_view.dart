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
    List<Note> noteList;

    Future getNotesByUserId({int userId}) async{
      setState(ViewState.loading);
      await Future.delayed(Duration(milliseconds: 3000));
      noteList = await noteService.getNotesByUserId(userId);
      setState(ViewState.done);
    }
}