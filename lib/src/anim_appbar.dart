import 'package:flutter/material.dart';

class AnimAppBar extends StatelessWidget {
  final String title;
  final double? heightAppbar;
  final TextStyle? titleStyle;
  final Widget? background;
  final dynamic child;
  final bool pinned;
  final Color? backgroundColor;

  AnimAppBar({
    Key? key,
    this.background,
    required this.child,
    required this.title,
    this.titleStyle,
    this.heightAppbar,
    this.pinned = true,
    this.backgroundColor = Colors.blueAccent,
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
            background: background,
          ),
          pinned: pinned,
          expandedHeight: heightAppbar != null
              ? heightAppbar
              : MediaQuery.of(context).size.height * .3,
          backgroundColor: backgroundColor,
        ),
        SliverList(delegate: SliverChildListDelegate([child]))
      ],
    );
  }
}
