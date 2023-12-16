import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool selectIcon = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => selectIcon = !selectIcon);
      },
      child: selectIcon
          ? Icon(
              CupertinoIcons.heart_fill,
              color: Theme.of(context).primaryColor,
            )
          : Icon(
              CupertinoIcons.heart,
              color: Theme.of(context).primaryColor,
            ),
    );
  }
}
