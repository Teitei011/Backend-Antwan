import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../fitness_app/components/meal_card.dart';

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
                    imagePath: 'assets/fitness_app/breakfast.png',
                    mealType: "Café da manhã",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                  MealCard(
                    imagePath: 'assets/fitness_app/lunch.png',
                    mealType: "Pós Treino",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  MealCard(
                    imagePath: 'assets/fitness_app/lunch.png',
                    mealType: "Lanche da manhã",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                  MealCard(
                    imagePath: 'assets/fitness_app/lunch.png',
                    mealType: "Almoço",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  MealCard(
                    imagePath: 'assets/fitness_app/snack.png',
                    mealType: "Lanche da tarde",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                  const SizedBox(height: 10),
                  MealCard(
                    imagePath: 'assets/fitness_app/dinner.png',
                    mealType: "Janta",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MealCard(
                imagePath: 'assets/fitness_app/dinner.png',
                mealType: "Ceia",
                mealItems: ["Arroz", "Feijão", "Carne"],
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
