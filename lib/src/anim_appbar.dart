import 'package:flutter/material.dart';

class AnimAppBar extends StatelessWidget {
  final String title;
  final double? heightAppbar;
  final TextStyle? titleStyle;
  String? imageAsset;
  String? imageUrl;
  final dynamic child;

  AnimAppBar({
    Key? key,
    this.imageAsset,
    this.imageUrl,
    required this.child,
    required this.title,
    this.titleStyle,
    this.heightAppbar,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              title,
              style: titleStyle,
            ),
            background: imageAsset != null
                ? Image.asset(imageAsset!)
                : Image.network(imageUrl!),
          ),
          pinned: true,
          expandedHeight: heightAppbar != null
              ? heightAppbar
              : MediaQuery.of(context).size.height * 1 / 3,
        ),
        child
      ],
    );
  }
}
