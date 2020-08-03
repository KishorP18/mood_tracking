import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_tracking/custom_circle.dart';
import 'package:mood_tracking/mood_card.dart';
import 'package:mood_tracking/mood_text.dart';
import 'package:mood_tracking/util.dart';

class MoodTrackingHome extends StatefulWidget {
  const MoodTrackingHome({Key key}):super(key:key);
  @override
  _MoodTrackingHomeState createState() => _MoodTrackingHomeState();
}

class _MoodTrackingHomeState extends State<MoodTrackingHome> {
  int _currentIndex=0;
  Duration _duration=const Duration(milliseconds: 1200);
  Duration _reverseDuration=const Duration(milliseconds: 100);

  void _setCurrentIndex(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final _width=MediaQuery.of(context).size.width;
    final _height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        primary: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const SizedBox(height: 40.0,),
          const Text("Hey Kishore"),
          const SizedBox(height: 16.0,),
          const Text("How're you feeling?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0),),
          const SizedBox(height: 20.0,),
          Container(
            height: _height/1.4,
            width: _width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                const BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
                gradient: LinearGradient(colors:
                [Util.expressionList[_currentIndex].backgroundColor.withOpacity(0.3),
                  Util.expressionList[_currentIndex].backgroundColor.withOpacity(0.9)])
            ),
            child: Stack(
              children: <Widget>[
              AnimatedSwitcher(
                duration: _duration,
                reverseDuration: _reverseDuration,
                transitionBuilder: (child,animation){
                  return SlideTransition(
                      child: child,
                    position: Tween<Offset>(
                      begin: Offset(0.0, 0.1),
                      end: Offset.zero,
                    ).animate(animation),);
                },
                child: MoodText(
                    key: ValueKey<int>(_currentIndex),
                    fontSize: 50.0,
                    moodText: Util.expressionList[_currentIndex].label),
              ),
               AnimatedSwitcher(
                  duration: _duration,
                  switchInCurve: Curves.linear,
                  switchOutCurve: Curves.linear,
                  reverseDuration:_reverseDuration,
                  transitionBuilder: (child,animation){
                    return ScaleTransition(
                      scale: Tween<double>(
                        begin: 1.4,
                        end: 1.0
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: MoodCard(
                      key: ValueKey<int>(_currentIndex),
                      image: SvgPicture.asset(Util.expressionList[_currentIndex].imagePath,width: _width/1.5,),
                    ),
                ),

                Positioned(
                    bottom: 64.0,
                    left: 40.0,
                    height: 50.0,
                    child: Container(
                      child:Row(
                        children: <Widget>[
                          InkWell(
                            onTap:()=>_setCurrentIndex(0),
                            child: CustomCircle(index: 0),
                          ),
                       const  SizedBox(width: 20.0,),
                          InkWell(
                            onTap:()=>_setCurrentIndex(1),
                            child: CustomCircle(index: 1),
                          ),
                          const   SizedBox(width: 20.0,),
                         InkWell(
                             onTap:()=>_setCurrentIndex(2),
                             child: CustomCircle(index: 2),
                         ),
                          const   SizedBox(width: 20.0,),
                          InkWell(
                            onTap:()=>_setCurrentIndex(3),
                            child: CustomCircle(index: 3),
                          ),

                          const   SizedBox(width: 20.0,),
                          InkWell(
                            onTap:()=>_setCurrentIndex(4),
                            child: CustomCircle(index: 4),
                          ),
                        ],
                      ) ,
                    )),

                Positioned(
                  bottom: 0.0,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: 60,
                    width: _width,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.5)
                    ),
                    child: Padding(
                      padding:const EdgeInsets.only(left: 16.0,bottom: 24.0),
                      child: Row(
                        children: <Widget>[
                         const Text("I'am feeling",style: TextStyle(
                             fontSize: 16.0,
                             color: Colors.white),),
                         const SizedBox(width: 4.0,),
                          AnimatedSwitcher(
                            duration: _duration,
                            reverseDuration: _reverseDuration,
                            switchInCurve: Curves.linear,
                            switchOutCurve: Curves.linear,
                            transitionBuilder: (child,animation){
                              return FadeTransition(
                                opacity: Tween<double>(
                                    begin: 0.0,
                                    end: 1.0,
                                  ).animate(animation),

                                 child: child,
                              );
                            },
                            child: Text(
                              Util.expressionList[_currentIndex].label,
                              key:ValueKey<int>(_currentIndex),style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),

    );
  }
}
