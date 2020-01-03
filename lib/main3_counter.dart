import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// Main app and Pages for Tab Layout
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
            providers: [
                StreamProvider<int>.value(value: xyz.intStream(), initialData: xyz.count,)

            ],
            child: DefaultTabController(
                length: 1,
                child: DefaultTabController(
                  length: 1,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Provider Demo"),
                      bottom: TabBar(
                        tabs: [
                          Tab(icon: Icon(Icons.add)),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        MyEventPage()
                      ],
                    ),
                  ),
                ))));
  }
}

// Event page (counting)
class MyEventPage extends StatefulWidget {
  @override
  _MyEventPageState createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {
  StreamController<int> ct;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var ct = Provider.of<int>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('StreamProvider Example'),
                SizedBox(height: 50),
                Text(ct.toString(), style: Theme.of(context).textTheme.display1)
              ],
            )),
        Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
            onPressed: () {
              xyz.add();
            },
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }

}


final xyz = EventProvider();

// EventProvider (Stream)
class EventProvider {
  StreamController<int> sc = StreamController();
  int count = 0;

  Stream<int> intStream() {
    return sc.stream;
  }

  add () {
    sc.add(++count);
  }

}
