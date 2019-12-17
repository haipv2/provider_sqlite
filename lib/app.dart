import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/router.dart';
import 'model_view/base_model_view.dart';
import 'page/home_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent
      ),
      initialRoute: 'init',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
