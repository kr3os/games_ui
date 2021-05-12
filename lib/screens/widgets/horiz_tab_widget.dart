import 'package:flutter/material.dart';

import 'package:games_ui/core/model/forum_model.dart';

import 'package:games_ui/screens/widgets/tab_text_widget.dart';
import 'package:games_ui/screens/widgets/forum_card_widget.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> with SingleTickerProviderStateMixin {

  int selectedTabIndex = 2;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  playAnimation(){
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Stack(
        children: <Widget>[
           Positioned(
             left: -30,
             bottom: 0,
             top: 0,
             width: 120.0,
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 70.0),
               child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
                TabText(
                  text: 'Media',
                  isSelected: selectedTabIndex == 0,
                  onTabTap: () => onTabTap(0),
                ),
                TabText(
                  text: 'Streamers',
                  isSelected: selectedTabIndex == 1,
                  onTabTap: () => onTabTap(1),
                ),
                TabText(
                  text:'Forum',
                  isSelected: selectedTabIndex == 2,
                  onTabTap: () => onTabTap(2),
                ),
               ],
              ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 65.0),
             child: FutureBuilder(
               future: playAnimation(),
               builder: (BuildContext context, AsyncSnapshot snapshot) {
                 return FadeTransition(
                   opacity: _animation,
                   child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: getList(selectedTabIndex),
                    ),
                 );
               },
             ),
           )
        ],
      ),
    );
  }

  List<Widget>getList(index){
    return [
      [
        ScaleTransition(
          scale: _animation,
          child: ForumCard(forum: haloForum),
          ),
        ForumCard(forum: titanForum),
        ForumCard(forum: halo3Forum),
        ForumCard(forum: magicForum),
        ForumCard(forum: chiefForum),
      ],
      [
        FadeTransition(
          opacity: _animation,
          child: ForumCard(forum: destinyForum),
          ),
        ForumCard(forum: halo3Forum),
        ForumCard(forum: titanForum),
        ForumCard(forum: haloForum),
        ForumCard(forum: magicForum),
      ],
      [
        ForumCard(forum: magicForum),
        ForumCard(forum: chiefForum),
        ForumCard(forum: titanForum),
        ForumCard(forum: destinyForum),
        ForumCard(forum: haloForum),
        ForumCard(forum: halo3Forum),
        ForumCard(forum: haloForum),
      ],
    ][index];
  }

  onTabTap(int index){
    setState(() {
      selectedTabIndex = index;
    });
  }
}