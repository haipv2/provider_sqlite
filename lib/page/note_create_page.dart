import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/enums/view_state.dart';
import 'package:provider_base/model/note.dart';
import 'package:provider_base/model_view/note_model.dart';

import 'base_page.dart';
import 'widget/loading_widget.dart';

class NoteCreatePage extends StatefulWidget {
  @override
  _NoteCreatePageState createState() => _NoteCreatePageState();
}

class _NoteCreatePageState extends State<NoteCreatePage> {
  TextEditingController _controller;
  NoteModel noteModel;

  @override
  void initState() {
    _controller = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage<NoteModel>(
      onModelReady: (model) {
        noteModel = model;
        print('onModeReady note model');
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'input note'),
              controller: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
                RaisedButton(
                  onPressed: () {
                    noteModel.openAddNote(Note(content: _controller.text));
                  },
                  child: Text('Add'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
