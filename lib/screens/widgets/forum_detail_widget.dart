import 'package:flutter/material.dart';

import 'package:games_ui/core/model/forum_model.dart';

import 'package:games_ui/screens/styles/text_style.dart';

import 'package:games_ui/screens/widgets/label_value_widget.dart';


class ForumDetailsWidget extends StatelessWidget {

  final Forum forum;

  const ForumDetailsWidget({this.forum});
  
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 16.0, top: 24.0, bottom: 12.0),
        height: 180.0,
        color: Colors.white, 
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 2.0,
                      ),
                    ),
                    height: 40.0,
                    width: 40.0,
                    child: Center(
                      child: Text(forum.rank,
                      style: rankStyle,
                      ),
                    ),
                  ),
                  Text('new', style: labelTextStyle,),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
             mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               LabelValueWidget(
                 value: forum.topics.length.toString(),
                 label: "Topics",
                 labelStyle: labelTextStyle,
                 valueStyle: valueTextStyle,
               ),
               LabelValueWidget(
                 value: forum.threads,
                 label: "Threads",
                 labelStyle: labelTextStyle,
                 valueStyle: valueTextStyle,
               ),
               LabelValueWidget(
                 value: forum.subs,
                 label: "Subs",
                 labelStyle: labelTextStyle,
                 valueStyle: valueTextStyle,
               ),
             ],
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final double distanceFromWall = 12;
  final double controlPointDistanceFromWall = 2;

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height * 0.5;
    final double width  = size.width;

    Path clippedPath = Path();
    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - distanceFromWall);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall,
     height - controlPointDistanceFromWall, 0 + distanceFromWall, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 30.0);
    clippedPath.quadraticBezierTo(width - 5, 0 + 5.0, width - 35, 0 + 15.0);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
  return true;
  }
}


