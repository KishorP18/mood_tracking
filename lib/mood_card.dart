import 'package:flutter/material.dart';

class MoodCard extends StatelessWidget {
  final Widget image;
  const MoodCard({Key key,@required this.image}):
        assert(image!=null),super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: image,);
  }
}
