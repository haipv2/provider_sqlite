import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/enums/view_state.dart';
import 'package:provider_base/model_view/base_model_view.dart';

import 'home_page.dart';
import 'widget/loading_widget.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return buildWidget();
  }

  Widget buildWidget() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return HomePage();
      }));
    });
    return LoadingPage();
  }
}

