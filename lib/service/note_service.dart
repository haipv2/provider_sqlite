import 'package:flutter/material.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/dao/note_dao.dart';
import 'package:provider_base/model/note.dart';

import 'base_service.dart';


class NoteService extends BaseService {
  @override
  void init() {
  }

  NoteDao noteDao = locator<NoteDao>();
  Future<List<Note>> getNotesByUserId(int userId) async{
    var result = await noteDao.findByUserId(userId);
    return result;


  }

}
