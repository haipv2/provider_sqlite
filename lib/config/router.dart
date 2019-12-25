import 'package:flutter/material.dart';
import 'package:provider_base/page/home_page.dart';
import 'package:provider_base/page/init_page.dart';
import 'package:provider_base/page/note_create_page.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'init':
        return MaterialPageRoute(builder: (_) => InitPage());
      case 'note_create':
        return MaterialPageRoute(builder: (_) => NoteCreatePage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center (
            child: Text('No toure defined for ${settings.name}'),
          ),
        ));
    }
  }
}
