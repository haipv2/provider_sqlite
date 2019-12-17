import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'config/locator.dart';

void main () async{
  Provider.debugCheckInvalidValueType = null;
  setupLocator();
  runApp(App());
}


