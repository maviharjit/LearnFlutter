import 'package:flutter/material.dart';
class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // is this drawing the game logo on the main/splash screen?
    // this this on code pen
    return Stack(
      children: [
        Container(
          height: 150,
          width: 200,
          child: Stack(
            children: [
              Positioned(
                right: 10,
                top: 70,
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70/2),
                    gradient: RadialGradient(
                      radius: 0.18,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(.35),
                      ],
                      stops: [1,1],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 50,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-50/360),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.white.withOpacity(1),
                    ),
                    height: 25,
                    width: 200,
                  ),
                ),
              ),
              Positioned(
                right: 50,
                bottom: 30,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(40/360),
                  child: Container (
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.white.withOpacity(1),
                    ),
                    height: 25,
                    width: 140,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ); // Stack
  }
}