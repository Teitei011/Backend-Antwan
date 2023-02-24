import 'package:naturalteam/fitness_app/fitness_app_theme.dart';
import 'package:naturalteam/fitness_app/models/meals_list_data.dart';
import 'package:flutter/material.dart';

class DietListInfo extends StatelessWidget {
  const DietListInfo({
    super.key,
    required List<MealsListData> mealsListData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: MealsListData.tabIconsList
          .map((meal) => Card(
                child: Column(
                  children: [
                    Image.asset(
                      meal.imagePath,
                      width: 100,
                      height: 100,
                    ),
                    Text(meal.titleTxt),
                    Text('${meal.kacl} kcal'),
                    Column(
                      children:
                          meal.meals?.map((item) => Text(item)).toList() ?? [],
                    ),
                  ],
                ),
              ))
          .toList(),
    ));
  }
}
