import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/model_view/home_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeModel model = locator<HomeModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('HOME PAGE'),
      ),
    );
  }
}
