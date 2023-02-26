import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../screens/diets/diet_screen.dart';

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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MinhaDieta(
              imagePath: imagePath,
              title: mealType,
              subtitle: mealItems.toString(),
              key: null,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: Container(
          width: 200,
          child: Card(
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
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
