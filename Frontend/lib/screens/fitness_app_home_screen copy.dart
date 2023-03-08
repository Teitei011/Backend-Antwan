import 'package:naturalteam/fitness_app/models/tabIcon_data.dart';
import 'package:naturalteam/screens/training/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:naturalteam/utils/allUserInfo.dart';
import 'diets/diet_screen_grid.dart';
import 'profile_screen.dart';
import 'package:naturalteam/fitness_app/bottom_navigation_view/bottom_bar_view.dart';
import 'package:naturalteam/fitness_app/fitness_app_theme.dart';
import 'package:naturalteam/fitness_app/my_diary/my_diary_screen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  List<dynamic> userData = [];

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    // userData = await fetchUserData();
    print(userData);
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      TrainingScreen(animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = DietScreen();
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = ProfilePage(
                    name: "Stefan",
                    email: "stefantleal14@gmail.com",
                    dateOfBirth: "24/08/1998",
                    height: "169",
                    weight: "53",
                    animationController: animationController,
                  );
                });
              });
            }
          },
        ),
      ],
    );
  }
}
