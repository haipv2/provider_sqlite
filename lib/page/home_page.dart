import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/model/note.dart';
import 'package:provider_base/provider/home_provider.dart';
import 'widget/loading_widget.dart';
import 'widget/note_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Note> listNoteStream = Provider.of<List<Note>>(context);
    return Scaffold(
      body: Center(
          child: listNoteStream == null
              ? LoadingPage()
              : buildListNoteUI(listNoteStream)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('note_create');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildListNoteUI(List<Note> listNoteStream) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return NoteWidget(listNoteStream[i]);
      },
      itemCount: listNoteStream.length,
    );
  }
}
