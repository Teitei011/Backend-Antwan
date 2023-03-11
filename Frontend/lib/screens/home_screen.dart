import 'dart:convert';

import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/components/bottombar_view.dart';
import 'package:naturalteam/fitness_app/components/exercise_card.dart';
import 'package:naturalteam/fitness_app/components/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:naturalteam/fitness_app/models/exercise.dart';
import 'package:naturalteam/utils/allUserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:naturalteam/fitness_app/fitness_app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // late Map<String, List<Map<String, String>>> _data = {};
  AnimationController? animationController;
  late Exercise exercises;

  HomeScreenState();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<Map<String, dynamic>> _fetchData() async {
    final dataFromServer = await fetchUserData();
    final decodedData = jsonDecode(dataFromServer);
    final jsonString = json.encode(decodedData);
    exercises = Exercise.fromJson(decodedData['exercises']);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonString);

    return decodedData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Map<String, dynamic>>(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            final data = snapshot.data!;

            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
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
                                    imagePath:
                                        'assets/fitness_app/morningSnack.png',
                                    mealType: "Café da manhã",
                                    mealItems: [],
                                  ),
                                  MealCard(
                                    imagePath:
                                        'assets/fitness_app/nightSnack.png',
                                    mealType: "Pós Treino",
                                    mealItems: [],
                                  ),
                                  MealCard(
                                    imagePath:
                                        'assets/fitness_app/breakfast.png',
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
                                    imagePath:
                                        'assets/fitness_app/nightSnack.png',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
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
                                      exercises: exercises,
                                    ),
                                    ExerciseCard(
                                      index: 1,
                                      exercises: exercises,
                                    ),
                                    ExerciseCard(
                                      index: 2,
                                      exercises: exercises,
                                    ),
                                    ExerciseCard(
                                      index: 3,
                                      exercises: exercises,
                                    ),
                                    ExerciseCard(
                                      index: 4,
                                      exercises: exercises,
                                    ),
                                    ExerciseCard(
                                      index: 6,
                                      exercises: exercises,
                                    ),
                                    ExerciseCard(
                                      index: 7,
                                      exercises: exercises,
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
                  Column(
                    children: [
                      Text(data["user"]["name"]),
                      Text(data["user"]["email"]),
                      // Text(data["user"]["dateOfBirth"] != null ? data : "N/A"),
                      Text(data?["user"]["dateOfBirth"].toString() ?? 'N/A'),
                      Text(data?["user"]["height"].toString() ?? 'N/A'),
                      Text(data?["user"]["weight"].toString() ?? 'N/A'),
                    ],
                  ),
                  Expanded(child: Container()),
                  CustomBottomBarView(),
                ]);
          },
        ),
      ),
    );
  }
}
