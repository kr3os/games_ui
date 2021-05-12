import 'package:flutter/material.dart';

import 'package:games_ui/screens/styles/colors_style.dart';

class AppBackground extends StatelessWidget {
  final Color firstColor, secondColor, thirdColor;

  AppBackground({this.firstColor, this.secondColor, this.thirdColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final height = constraints.maxHeight;
        final width  = constraints.maxWidth;

        // print("height $height,  width $width");

        return Stack( 
        children: <Widget>[
          Container(
            color: backgroundColor,
          ),
          Positioned(
            left: -(height/2 - width/2),
            bottom: height * 0.25,
            child: Container(
              height: height,
              width:  height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: firstColor
              ),
            ),
           ),
           Positioned(
            left: width * 0.15,
            top: -width * 0.5,
            child: Container(
              height: width * 1.5,
              width:  width * 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondColor
              ),
            ),
           ),
           Positioned(
            right: -width * 0.2,
            top: -50,
            child: Container(
              height: width * 0.5,
              width:  width * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: thirdColor
              ),
            ),
           ),
          ],
        );
      },
    );
  }
}