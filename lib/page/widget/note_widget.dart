import 'package:flutter/material.dart';
import 'package:provider_base/model/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  const NoteWidget(this.note);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: PageStorageKey<Note>(note),
      title: Text(note.content),
      children: <Widget>[
        Text(note.content)
      ],
    );
  }
}
