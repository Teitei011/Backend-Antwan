import "package:flutter/material.dart";
import "package:naturalteam/fitness_app/bottom_navigation_view/bottom_bar_view.dart";
import "package:naturalteam/fitness_app/models/tabIcon_data.dart";
import "package:naturalteam/fitness_app/my_diary/my_diary_screen.dart";
import "package:naturalteam/screens/diets/diet_screen_grid.dart";
import "package:naturalteam/screens/profile_screen.dart";
import "package:naturalteam/screens/training/training_screen.dart";

class CustomBottomBarView extends StatelessWidget {
  final Map<String, dynamic>? data;

  const CustomBottomBarView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarView(
      tabIconsList: TabIconData.tabIconsList,
      addClick: () {
        Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => MyDiaryScreen(),
          ),
        );
      },
      changeIndex: (int index) {
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
              builder: (BuildContext context) => ProfilePage(
                name: data?["user"]["name"].toString() ?? 'N/A',
                email: data?["user"]["email"].toString() ?? 'N/A',
                dateOfBirth: data?["user"]["dateOfBirth"].toString() ?? 'N/A',
                height: data?["user"]["height"].toString() ?? 'N/A',
                weight: data?["user"]["weight"].toString() ?? 'N/A',
              ),
              fullscreenDialog: true,
            ),
          );
        }
      },
    );
  }
}
