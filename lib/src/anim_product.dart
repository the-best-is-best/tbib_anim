import 'package:flutter/material.dart';

class AnimProduct extends StatefulWidget {
  final double heightCatContainer;
  final List<dynamic> itemCatData;
  final List<String> headersCatName;
  final List<TextStyle> textStyleCat;
  final List<dynamic> itemData;
  final List<String> itemHeaderData;
  final List<TextStyle> textStyleHeaderData;
  final bool isNotProduct;
  final heightProductFactor;
  final Duration duration;
  const AnimProduct({
    required this.heightCatContainer,
    required this.itemCatData,
    required this.headersCatName,
    required this.textStyleCat,
    required this.itemData,
    required this.itemHeaderData,
    required this.textStyleHeaderData,
    this.isNotProduct = false,
    this.heightProductFactor = .7,
    this.duration = const Duration(milliseconds: 200),
  });
  @override
  _AnimProduct createState() => _AnimProduct();
}

class _AnimProduct extends State<AnimProduct> {
  final ScrollController scrollController = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];
  @override
  void initState() {
    super.initState();
    List<Widget> listItems = [];
    scrollController.addListener(() {
      double value = scrollController.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = scrollController.offset > 50;
      });
    });

    widget.itemData.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0;
                          i < widget.itemHeaderData.length;
                          i++) ...{
                        Text(
                          post[widget.itemHeaderData[i]].toString(),
                          style: widget.textStyleHeaderData[i],
                        ),
                      }
                    ],
                  ),
                  widget.isNotProduct == false
                      ? Image.network(
                          "${post["image"]}",
                          height: double.infinity,
                        )
                      : Container()
                ],
              ))));
    });

    setState(() {
      itemsData = listItems;
    });
    print(itemsData.length);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          AnimatedOpacity(
            duration: widget.duration,
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
              duration: widget.duration,
              width: size.width,
              alignment: Alignment.topCenter,
              height: closeTopContainer ? 0 : widget.heightCatContainer,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.itemCatData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(children: <Widget>[
                        Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 20),
                          height: widget.heightCatContainer,
                          decoration: BoxDecoration(
                              color: Colors.orange.shade400,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  for (int i = 0;
                                      i < widget.headersCatName.length;
                                      i++) ...{
                                    Text(
                                      widget.itemCatData[index]
                                          [widget.headersCatName[i]],
                                      style: widget.textStyleCat[i],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  }
                                ],
                              )),
                        )
                      ]);
                    }),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: itemsData.length,
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
                            heightFactor: widget.heightProductFactor,
                            alignment: Alignment.topCenter,
                            child: itemsData[index]),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
