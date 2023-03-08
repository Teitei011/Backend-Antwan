import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/components/exercise_card.dart';
import 'package:naturalteam/fitness_app/components/meal_card.dart';
import 'package:naturalteam/fitness_app/models/tabIcon_data.dart';
import 'package:naturalteam/fitness_app/my_diary/water_view.dart';
import 'package:naturalteam/fitness_app/ui_view/body_measurement.dart';
import 'package:naturalteam/screens/training/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:naturalteam/utils/allUserInfo.dart';
import 'diets/diet_screen_grid.dart';
import 'profile_screen.dart';
import 'package:naturalteam/fitness_app/bottom_navigation_view/bottom_bar_view.dart';
import 'package:naturalteam/fitness_app/fitness_app_theme.dart';
import 'package:naturalteam/fitness_app/my_diary/my_diary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<dynamic> _data = [];

  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    fetchUserData().then((data) {
      setState(() {
        _data = data;
        print(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          AppBar(
            backgroundColor: FitnessAppTheme.background,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu),
              color: FitnessAppTheme.darkText,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                color: FitnessAppTheme.darkText,
                onPressed: () {},
              ),
            ],
            title: Text('Vamos Treinar?',
                style: TextStyle(
                    color: FitnessAppTheme.darkText,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.background,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Text("Comidas de hoje",
                              style: TextStyle(
                                  color: AppTheme.deactivatedText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MealCard(
                            imagePath: 'assets/fitness_app/morningSnack.png',
                            mealType: "Café da manhã",
                            mealItems: [],
                          ),
                          MealCard(
                            imagePath: 'assets/fitness_app/nightSnack.png',
                            mealType: "Pós Treino",
                            mealItems: [],
                          ),
                          MealCard(
                            imagePath: 'assets/fitness_app/breakfast.png',
                            mealType: "Lanche da manhã",
                            mealItems: [],
                          ),
                          MealCard(
                            imagePath: 'assets/fitness_app/lunch.png',
                            mealType: "Almoço",
                            mealItems: [],
                          ),
                          MealCard(
                            imagePath: 'assets/fitness_app/snack.png',
                            mealType: "Lanche da tarde",
                            mealItems: [],
                          ),
                          const SizedBox(height: 10),
                          MealCard(
                            imagePath: 'assets/fitness_app/dinner.png',
                            mealType: "Janta",
                            mealItems: [],
                          ),
                          MealCard(
                            imagePath: 'assets/fitness_app/nightSnack.png',
                            mealType: "Ceia",
                            mealItems: [],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.background,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Text("Exercicios de  hoje",
                              style: TextStyle(
                                  color: AppTheme.deactivatedText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ExerciseCard(
                              index: 0,
                            ),
                            ExerciseCard(
                              index: 1,
                            ),
                            ExerciseCard(
                              index: 2,
                            ),
                            ExerciseCard(
                              index: 3,
                            ),
                            ExerciseCard(
                              index: 4,
                            ),
                            ExerciseCard(
                              index: 6,
                            ),
                            ExerciseCard(
                              index: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          BottomBarView(
            tabIconsList: TabIconData.tabIconsList,
            addClick: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => MyDiaryScreen()),
              );
            },
            changeIndex: (int index) {
              if (index == 1) {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => TrainingScreen()),
                );
              } else if (index == 2) {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => DietScreen()),
                );
              } else if (index == 2) {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => ProfilePage(
                          Nome: _data[0]['name'],
                          Email: _data[0]['email'],
                          dateOfBirth: _data[0]['dateOfBirth'],
                          height: _data[0]['height'],
                          weight: _data[0]['weight'])),
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}
