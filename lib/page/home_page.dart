import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/enums/view_state.dart';
import 'package:provider_base/model/note.dart';
import 'package:provider_base/model_view/base_model_view.dart';
import 'package:provider_base/service/note_service.dart';

import 'widget/loading_widget.dart';
import 'widget/note_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BaseModel model;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    model = Provider.of<BaseModel>(context);
    print(model);
    return Scaffold(
      body: Center(
          child: model.state == ViewState.loading
              ? LoadingPage()
              : buildListNoteUI()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => Scaffold(
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
                                model.openAddNote(
                                    Note(content: _controller.text));
                              },
                              child: Text('Add'),
                            )
                          ],
                        )
                      ],
                    ),
                  ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildListNoteUI() {
    return model.noteList.isEmpty
        ? Center(
            child: Text('No Item'),
          )
        : ListView.builder(
            itemBuilder: (context, i) {
              return NoteWidget(model.noteList[i]);
            },
            itemCount: model.noteList.length,
          );
  }

//  Future<void> loadingPage() async {
//    await model.getNotesByUserId().then((data) {
//      print(data);
//    });
//  }
}
