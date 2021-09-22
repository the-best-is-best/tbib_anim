import 'package:flutter/material.dart';
import 'package:tbib_anim/tbib_anim.dart';

Widget animAppbar(String title) {
  return AnimAppBar(
    title: title,
    background: Image.network(
        "https://p.kindpng.com/picc/s/393-3933176_flutter-app-development-flutter-developer-hd-png-download.png"),
    child: SliverList(
        delegate: SliverChildListDelegate([
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Text("Text Here");
        },
      ),
    ])),
  );
}
