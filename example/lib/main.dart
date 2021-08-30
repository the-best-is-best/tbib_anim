import 'package:example/src/anim_items_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:tbib_anim/tbib_anim.dart';

import 'src/anim_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Anim appbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: page == 0
            ? null
            : AppBar(
                title: Text("some animation"),
              ),
        body:
            page == 0 ? animAppbar(widget.title) : myAnimListViewHorizontal());
  }
}
