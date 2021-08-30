# tbib_anim

This Package for animated some widgets.

## download library from github and see code in exmaple
  if int page = 0 

  you will see AnimAppBar

  if int page = 1
  you will see anim_cat_&_product

## anim_cat_&_product

# usage

```dart

// class category
   class DummyCategoeryProduct{
       static List<Map<String, String>> dummyData = [
        {"title": "Most\nFavorites", "itemCount": "10 items"},
        {"title": "Newest", "itemCount": "20 item"},
        {"title": "Super\nSaving", "itemCount": "5 item"},
       ];
   }
// class pproduct
   class DummyProduct {
       static List<dynamic> dummyData = [
        {
        "name": "Burger",
        "brand": "Hawkers",
        "price": 2.99,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/burger.png"
        },
        {
        "name": "Cheese Dip",
        "brand": "Hawkers",
        "price": 4.99,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/cheese_dip.png"
        },
        {
        "name": "Cola",
        "brand": "Mcdonald",
        "price": 1.49,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/cola.png"
        },
        {
        "name": "Fries",
        "brand": "Mcdonald",
        "price": 2.99,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/fries.png"
        },
        {
        "name": "Ice Cream",
        "brand": "Ben & Jerry's",
        "price": 9.49,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/ice_cream.png"
        },
        {
        "name": "Noodles",
        "brand": "Hawkers",
        "price": 4.49,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/noodles.png"
        },
        {
        "name": "Pizza",
        "brand": "Dominos",
        "price": 17.99,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/pizza.png"
        },
        {
        "name": "Sandwich",
        "brand": "Hawkers",
        "price": 2.99,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/sandwich.png"
        },
        {
        "name": "Wrap",
        "brand": "Subway",
        "price": 6.99,
        "image":
            "https://raw.githubusercontent.com/the-best-is-best/tbib_anim/master/example/assets/images/wrap.png"
        }
    ]; 
   }

   // Alert package read image from image map key  

   // widgets
  AnimProduct(
          heightCatContainer: MediaQuery.of(context).size.height * 0.3,
          itemCatData: DummyCategoeryProduct.dummyData,
          headersCatName: ["title", "itemCount"],
          textStyleCat: [
            TextStyle(
                //title style
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                // itemCount style
            TextStyle(fontSize: 16, color: Colors.white),
          ],
          itemData: DummyProduct.dummyData,
          itemHeaderData: ["name", "brand", "price"],
          textStyleHeaderData: [
              // namee style
            TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            // brand style
            TextStyle(fontSize: 17, color: Colors.grey),
            // price style
            TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ],
          duration: Duration(milliseconds: 500),


          //  isNotProduct if not product data and not display image
        ),

```


## anim_app_bar 0.0.1

# default value for some vairable

  property      | description
--------------  |------------
  heightAppbar  | MediaQuery.of(context).size.height * 1 / 3


# usage like this with image network

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



# usage like this with image asset

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



