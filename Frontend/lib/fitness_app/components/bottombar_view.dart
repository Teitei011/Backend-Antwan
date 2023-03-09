import "package:flutter/material.dart";
import "package:naturalteam/fitness_app/bottom_navigation_view/bottom_bar_view.dart";
import "package:naturalteam/fitness_app/models/tabIcon_data.dart";
import "package:naturalteam/fitness_app/my_diary/my_diary_screen.dart";
import "package:naturalteam/screens/diets/diet_screen_grid.dart";
import "package:naturalteam/screens/home_screen.dart";
import "package:naturalteam/screens/profile_screen.dart";
import "package:naturalteam/screens/training/training_screen.dart";

class CustomBottomBarView extends StatelessWidget {
  const CustomBottomBarView({Key? key, this.data});

  final Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: BottomBarView(
        tabIconsList: TabIconData.tabIconsList,
        addClick: () {
          Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => HomeScreen(),
            ),
          );
        },
        changeIndex: (int index) {
          if (index == 0) {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => HomeScreen(),
                ));
          }

          if (index == 1) {
            Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => TrainingScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => DietScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
