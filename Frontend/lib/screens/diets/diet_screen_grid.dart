import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:naturalteam/fitness_app/components/bottombar_view.dart';
import 'package:naturalteam/fitness_app/models/diet.dart';

import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/components/meal_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late Map<String, dynamic> _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('data');

    if (jsonString != null) {
      setState(() {
        _data = json.decode(jsonString);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Sua dieta",
                style: TextStyle(
                  color: AppTheme.darkText,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return MealCard(
                        imagePath: 'assets/fitness_app/morningSnack.png',
                        mealType: "Café da manhã",
                        mealItems: [],
                      );
                    case 1:
                      return MealCard(
                        imagePath: 'assets/fitness_app/nightSnack.png',
                        mealType: "Pós Treino",
                        mealItems: [],
                      );
                    case 2:
                      return MealCard(
                        imagePath: 'assets/fitness_app/breakfast.png',
                        mealType: "Lanche da manhã",
                        mealItems: [],
                      );
                    case 3:
                      return MealCard(
                        imagePath: 'assets/fitness_app/lunch.png',
                        mealType: "Almoço",
                        mealItems: [],
                      );
                    case 4:
                      return MealCard(
                        imagePath: 'assets/fitness_app/snack.png',
                        mealType: "Lanche da tarde",
                        mealItems: [],
                      );
                    case 5:
                      return MealCard(
                        imagePath: 'assets/fitness_app/dinner.png',
                        mealType: "Janta",
                        mealItems: [],
                      );
                    default:
                      throw Exception("Unknown index $index");
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBarView(),
    );
  }
}
