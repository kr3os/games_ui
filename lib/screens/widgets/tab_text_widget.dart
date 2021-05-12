import 'package:flutter/material.dart';

import 'package:games_ui/screens/styles/text_style.dart';

class TabText extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function onTabTap;

  TabText({this.text, this.isSelected, this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58,
      child: InkWell(
        onTap: onTabTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: isSelected ? seclectedTabStyle : defaultTabStyle,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}