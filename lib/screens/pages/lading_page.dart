import 'package:flutter/material.dart';

import 'package:games_ui/screens/widgets/horiz_tab_widget.dart';
import 'package:games_ui/screens/widgets/app_bground_widget.dart';

import 'package:games_ui/screens/styles/text_style.dart';
import 'package:games_ui/screens/styles/colors_style.dart';

class LadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstCircleColor, 
            secondColor: secondCircleColor, 
            thirdColor: thirdCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    elevation: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.apps,color: primaryColor,)),
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                ),
              ),
              HeadingSubHeadingWidget(),
              SizedBox(
                height: 20.0,
              ),
              HorizontalTabLayout(),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 25.0),
                  child: Text("New topic", style: buttonStyle),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0))
                  ),
                ),
              ),
            ],
          ),
          // Center(
          //   child: HorizontalTabLayout(),
          // )
        ],
      ),
    );
  }
}

class HeadingSubHeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Forum',
            style: headingStyle,
          ),
          Text(
            'Kick of the conversation',
            style: subHeadingStyle,
          ),
        ],
      ),
    );
  }
}