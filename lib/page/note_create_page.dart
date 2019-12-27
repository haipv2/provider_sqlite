import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/enums/view_state.dart';
import 'package:provider_base/model/note.dart';
import 'package:provider_base/provider/home_provider.dart';
import 'widget/loading_widget.dart';

class NoteCreatePage extends StatefulWidget {
  @override
  _NoteCreatePageState createState() => _NoteCreatePageState();
}

class _NoteCreatePageState extends State<NoteCreatePage> {
  TextEditingController _controller;

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

  HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeProvider>(context);
    return Scaffold(
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
//                noteDao.addNote(Note(content: _controller.text));
                  provider.addNewNote(Note(content: _controller.text));
                },
                child: Text('Add'),
              )
            ],
          )
        ],
      ),
    );
  }
}
