import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  CustomPageRoute( {
    required this.child,
     this.direction=AxisDirection.right,
  }) : super(
            transitionDuration: Duration(seconds: 1),
            reverseTransitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext content, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: getbeginoffset(), end: Offset.zero)
            .animate(animation),
        child: child,
      );
      
      Offset getbeginoffset(){
        switch(direction){
              case AxisDirection.up:
              return Offset(0, 1);
               case AxisDirection.down:
              return Offset(0, -1);
               case AxisDirection.right:
              return Offset(-1, 0);
               case AxisDirection.left:
              return Offset(1, 0);
        }
      }
}
