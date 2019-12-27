import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/model/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;

  const NoteWidget(this.note);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      key: Key(note.content),
      onDismissed: (direction) {
//        model.removeNote(note);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Item is removed')));
      },
      child: ExpansionTile(
        key: PageStorageKey<Note>(note),
        title: Text(note.content),
        children: <Widget>[Text(note.content)],
      ),
    );
  }
}
