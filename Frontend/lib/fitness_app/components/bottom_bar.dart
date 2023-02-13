import 'package:flutter/material.dart';

import '../bottom_navigation_view/bottom_bar_view.dart';
import '../models/tabIcon_data.dart';
import '../my_diary/my_diary_screen.dart';
import '../training/training_screen.dart';

// create class bottomBar
class BottomBar extends StatelessWidget {
  BottomBar(
      {required this.animationController,
      required this.tabBody,
      Key? key,
      required Null Function() press,
      required List<TabIconData> tabIconsList});

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  final animationController;
  final Widget tabBody;

  bool? get mounted => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          const Expanded(
            child: SizedBox(),
          ),
          BottomBarView(
              tabIconsList: tabIconsList,
              addClick: () {},
              changeIndex: (int index) {
                MyDiaryScreen(animationController: animationController);
              }),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
