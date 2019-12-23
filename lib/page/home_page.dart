import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/enums/view_state.dart';
import 'package:provider_base/model_view/base_model_view.dart';
import 'package:provider_base/service/note_service.dart';

import 'widget/loading_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    model = Provider.of<BaseModel>(context);
    print(model);
    return Scaffold(
        body: Center(
            child: model.state == ViewState.loading
                ? LoadingPage()
                : Text('HOME PAGE')));
  }

//  Future<void> loadingPage() async {
//    await model.getNotesByUserId().then((data) {
//      print(data);
//    });
//  }
}
