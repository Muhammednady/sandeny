import 'package:flutter/material.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../constants/styles_manager.dart';

class ShowCaseView extends StatelessWidget {
  const ShowCaseView(
      {Key? key,
      required this.globalKey,
      required this.title,
      required this.description,
      required this.child,
      this.shapeBorder = const CircleBorder()})
      : super(key: key);

  final GlobalKey globalKey;
  final String title;
  final String description;
  final Widget child;
  final ShapeBorder shapeBorder;
  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: globalKey,
      title: title,
      description: description,
      targetShapeBorder: shapeBorder,
      tooltipBackgroundColor: ColorsManager.primaryColor,
      textColor: Colors.white,
      titleTextStyle: getMediumStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      descTextStyle: getRegularStyle(color: Colors.white, fontSize: 12),
      child: child,
    );
  }
}
