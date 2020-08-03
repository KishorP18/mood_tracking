import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final int index;
  final Color color;
   const CustomCircle({Key key,@required this.index,this.color= Colors.red}):
         assert(index!=null)
  ,super(key:key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:  color.withOpacity(0.3),
        shape: BoxShape.circle,
        boxShadow: [
        const  BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Text("$index"),
      height: 40.0,width: 40.0,);
  }
}
