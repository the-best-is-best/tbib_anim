import 'package:flutter/material.dart';
import 'package:tbib_anim/tbib_anim.dart';

import 'dummy_data/horizontal_item.dart';

Widget myAnimListViewHorizontal() {
  return AnimListViewHorizontal(
    heightContainer: 20,
    itemData: DammyDataHorizontal.dummyData,
    lengthHeaderName: 4,
  );
}
