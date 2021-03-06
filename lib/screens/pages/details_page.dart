import 'package:flutter/material.dart';

import 'package:games_ui/core/model/forum_model.dart';
import 'package:games_ui/core/model/topic_model.dart';

import 'package:games_ui/screens/styles/text_style.dart';
import 'package:games_ui/screens/styles/colors_style.dart';

import 'package:games_ui/screens/widgets/app_bground_widget.dart';
import 'package:games_ui/screens/widgets/label_value_widget.dart';

class DetailsPage extends StatefulWidget {
  final Forum forum;

  DetailsPage({this.forum});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(_controller);
  }
   _playAnimation(){
     _controller.reset();
     _controller.forward();
   }

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // print("forum ${widget.forum.title}");
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstBlueCircleColor,
            secondColor: secondBlueCircleColor,
            thirdColor: thirdBlueCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60.0),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.arrow_back,
                  color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              FutureBuilder(
                future: _playAnimation(),
                builder: (context, snapshot){
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 100.0),
                    child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      LabelValueWidget(
                        value: widget.forum.topics.length.toString(),
                        label: "Topics",
                        labelStyle: whiteLabelTextStyle,
                        valueStyle: whiteValueTextStyle,
                      ),
                      LabelValueWidget(
                        value: widget.forum.threads,
                        label: "Threads",
                        labelStyle: whiteLabelTextStyle,
                        valueStyle: whiteValueTextStyle,
                      ),
                      LabelValueWidget(
                        value: widget.forum.subs,
                        label: "Subs",
                        labelStyle: whiteLabelTextStyle,
                        valueStyle: whiteValueTextStyle,
                      ),
                      ],
                     ),
                 ),
                  );
                },
              ),
              SizedBox(height: 20.0,),
              Hero(
                tag: widget.forum.title,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
                  child: Image.asset(widget.forum.imagePath)
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
              child: Container(
                height: 300.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Topics", style: subHeadingStyle.copyWith(fontSize: 26)),
                      Expanded(
                        child: SlideTransition(
                          position: _offsetAnimation,
                        child: ListView(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 20),
                            children: <Widget>[
                              TopicsTile(topic: widget.forum.topics[0]),
                              SizedBox(height: 15),
                              TopicsTile(topic: widget.forum.topics[1]),
                              SizedBox(height: 15),
                              TopicsTile(topic: widget.forum.topics[0]),
                            ],
                        ),
                       ),
                      ),
                    ],
                  ),
                ),
              )
             ),
          ),
          Positioned(
            bottom: 265,
            right: 20,
            child: ScaleTransition(
              scale: _scaleAnimation,
            child: Material(
              elevation: 1.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.forum.rank,
                  style: rankBigStyle,
                ),
              ),
              color: Colors.white,
              shape: CircleBorder(),
             ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicsTile extends StatelessWidget {

  final Topic topic;

  TopicsTile({this.topic});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              topic.question,
              style: topicQuestionTextStyle
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: primaryColor
              ),
              child: Text(
                topic.anwserCount,
                style: topicAnswerCountTextStyle,
              ),
            )
          ],
        ),
        SizedBox(height: 4.0,),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Text(
            topic.recentAnswer,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: topicAnswerTextStyle
          ),
        )
      ],
    );
  }
}
