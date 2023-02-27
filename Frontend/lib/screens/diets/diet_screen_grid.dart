import 'package:flutter/material.dart';
import 'package:naturalteam/fitness_app/models/diet.dart';

import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/components/meal_card.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: ListView(children: [
          // Large text in the middle saying Sign up to Bora Treinar?
          const SizedBox(height: 10),

          Center(
            child: Text("Sua dieta",
                style: TextStyle(
                    color: AppTheme.darkText,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),

          const SizedBox(height: 20),

          Container(
            child: Column(children: [
              Row(
                children: [
                  MealCard(
                    imagePath: 'assets/fitness_app/morningSnack.png',
                    mealType: "Café da manhã",
                    mealItems: dietTemplate.breakfast,
                  ),
                  MealCard(
                    imagePath: 'assets/fitness_app/nightSnack.png',
                    mealType: "Pós Treino",
                    mealItems: dietTemplate.postWorkout,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  MealCard(
                    imagePath: 'assets/fitness_app/breakfast.png',
                    mealType: "Lanche da manhã",
                    mealItems: dietTemplate.morningSnack,
                  ),
                  MealCard(
                    imagePath: 'assets/fitness_app/lunch.png',
                    mealType: "Almoço",
                    mealItems: dietTemplate.lunch,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  MealCard(
                    imagePath: 'assets/fitness_app/snack.png',
                    mealType: "Lanche da tarde",
                    mealItems: dietTemplate.afternoonSnack,
                  ),
                  const SizedBox(height: 10),
                  MealCard(
                    imagePath: 'assets/fitness_app/dinner.png',
                    mealType: "Janta",
                    mealItems: dietTemplate.dinner,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MealCard(
                imagePath: 'assets/fitness_app/nightSnack.png',
                mealType: "Ceia",
                mealItems: dietTemplate.nightSnack,
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
