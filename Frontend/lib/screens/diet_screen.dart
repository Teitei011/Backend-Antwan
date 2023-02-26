import 'package:naturalteam/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../app_theme.dart';
import '../fitness_app/components/button.dart';

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              // Large text in the middle saying Sign up to Bora Treinar?
              const SizedBox(height: 10),

              Text("Sua dieta",
                  style: TextStyle(
                      color: AppTheme.darkText,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),

              Container(
                height: 1500,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                child: ListView(children: [
                  MealCard(
                    imagePath: 'assets/fitness_app/breakfast.png',
                    mealType: "Café da manhã",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                  const SizedBox(height: 10),
                  MealCard(
                    imagePath: 'assets/fitness_app/lunch.png',
                    mealType: "Almoço",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                  const SizedBox(height: 10),
                  MealCard(
                    imagePath: 'assets/fitness_app/snack.png',
                    mealType: "Lanche",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                  const SizedBox(height: 10),
                  MealCard(
                    imagePath: 'assets/fitness_app/dinner.png',
                    mealType: "Janta",
                    mealItems: ["Arroz", "Feijão", "Carne"],
                  ),
                  const SizedBox(height: 10),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String imagePath;
  final String mealType;
  final List<String> mealItems;

  MealCard(
      {required this.imagePath,
      required this.mealType,
      required this.mealItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.white,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(mealType,
              style: TextStyle(
                  color: AppTheme.darkText,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          Column(
            children: mealItems.map((item) => Text(item)).toList(),
          ),
        ],
      ),
    );
  }
}
