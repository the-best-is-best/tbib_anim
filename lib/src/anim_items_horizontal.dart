import 'package:flutter/material.dart';

class AnimListViewHorizontal extends StatefulWidget {
  final double heightContainer;
  final List<dynamic> itemData;
  final int lengthHeaderName;
  const AnimListViewHorizontal(
      {required this.heightContainer, required this.itemData, required this.lengthHeaderName});
  @override
  _AnimListViewHorizontal createState() => _AnimListViewHorizontal();
}

class _AnimListViewHorizontal extends State<AnimListViewHorizontal> {
  final ScrollController scrollController = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> listItems = [];

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        double value = scrollController.offset / 119;

        topContainer = value;
        closeTopContainer = scrollController.offset > 50;
      });
    });
    List<Widget> calcItem = [];

    widget.itemData.forEach((post) {
      calcItem.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      listItems = calcItem;
    });
    print(widget.itemData.length);

    print(listItems.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: closeTopContainer ? 0 : 1,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: size.width,
          alignment: Alignment.topCenter,
          height: closeTopContainer ? 0 : widget.heightContainer,
          child: ListView.builder(
              controller: scrollController,
              itemCount: listItems.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                double scale = 1.0;
                if (topContainer > 0.5) {
                  scale = index + 0.5 - topContainer;
                  if (scale < 0) {
                    scale = 0;
                  } else if (scale > 1) {
                    scale = 1;
                  }
                }
                return Opacity(
                  opacity: scale,
                  child: Transform(
                    transform: Matrix4.identity()..scale(scale, scale),
                    alignment: Alignment.bottomCenter,
                    child: Align(
                        heightFactor: 0.7,
                        alignment: Alignment.topCenter,
                        child: listItems[index]),
                  ),
                );
              })),
    );
  }
}
