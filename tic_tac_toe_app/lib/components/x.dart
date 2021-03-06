import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/theme/theme.dart';

class X extends StatelessWidget {

  double size;
  double height;

  X(this.size, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      // stack widget takes multiple widgets and renders them one on top of another
      child: Stack(
        children: [
          // positioned widget is for positioning the various widget in the stack
          Positioned (
            left: 0,
            top: size/2 - height/2,
            // creates one slash for the X, as a rotated box
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(-45/360),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.1,0.8],
                    colors: [
                      MyTheme.blueViolet,
                      MyTheme.deepPick,
                    ],
                  ),
                ),
                height: height,
                width: size,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: size/2 - height/2,
            child: RotationTransition(
              // creates the other slash for the X
              turns: AlwaysStoppedAnimation(45/360),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.1, 0.8],
                    colors: [MyTheme.deepPick,MyTheme.blueViolet]
                  ),
                ),
                height: height,
                width: size,
              ),
            ),
          ),
        ],
      ),
    ); // Container
  }
}