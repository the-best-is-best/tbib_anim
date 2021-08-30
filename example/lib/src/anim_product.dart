import 'package:example/src/dummy_data/category_product.dart';
import 'package:example/src/dummy_data/product.dart';
import 'package:flutter/material.dart';
import 'package:tbib_anim/tbib_anim.dart';

Widget myAnimProduct() {
  return Builder(
    builder: (context) {
      return Container(
        child: AnimProduct(
          heightCatContainer: MediaQuery.of(context).size.height * 0.3,
          itemCatData: DummyCategoeryProduct.dummyData,
          headersCatName: ["title", "itemCount"],
          textStyleCat: [
            TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            TextStyle(fontSize: 16, color: Colors.white),
          ],
          itemData: DummyProduct.dummyData,
          itemHeaderData: ["name", "brand", "price"],
          textStyleHeaderData: [
            TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            TextStyle(fontSize: 17, color: Colors.grey),
            TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ],
          duration: Duration(milliseconds: 500),
        ),
      );
    },
  );
}
