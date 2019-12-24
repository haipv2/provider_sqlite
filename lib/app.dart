import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/locator.dart';
import 'config/router.dart';
import 'enums/view_state.dart';
import 'model_view/base_model_view.dart';
import 'page/base_page.dart';
import 'page/home_page.dart';
import 'page/init_page.dart';
import 'page/widget/loading_widget.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
//  BaseModel baseModel = locator<BaseModel>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orangeAccent),
//      initialRoute: 'init',
      onGenerateRoute: Router.generateRoute,
      home: BasePage<BaseModel>(
        onModelReady: (model) {
          model.getNotesByUserId();
        },
        child: HomePage(),
      ),
    );
  }
}
