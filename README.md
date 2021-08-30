# tbib_anim

This Package for animated some widgets.

# anim_app_bar

# default value for some vairable

  property      | description
--------------  |------------
  heightAppbar  | MediaQuery.of(context).size.height * 1 / 3


## usage like this with image network

``` dart
Scaffold(
      body: AnimAppBar(
        title: widget.title,
        imageUrl:
            "https://p.kindpng.com/picc/s/393-3933176_flutter-app-development-flutter-developer-hd-png-download.png",
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
      ),
    );
```



## usage like this with image asset

``` dart
Scaffold(
      body: AnimAppBar(
        title: widget.title,
        imageAsset:
            "assets/url_image_name.png",
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
      ),
    );
```



