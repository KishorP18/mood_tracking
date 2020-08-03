import 'package:flutter/material.dart';

class MoodText extends StatelessWidget {
  final String moodText;
  final double fontSize;
  const MoodText({Key key,@required this.moodText,this.fontSize=20.0}):assert(moodText!=null)
  ,super(key:key);
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top:40.0),
      child: Container(
        alignment: Alignment.topCenter,
        child: Text(moodText,style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            wordSpacing: 2.0,
            fontWeight:FontWeight.w900,fontSize: fontSize),
        ),),
    );
  }
}
