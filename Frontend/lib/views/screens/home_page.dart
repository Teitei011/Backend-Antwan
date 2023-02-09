import 'package:hungry/views/widgets/custom_app_bar.dart';
import 'package:hungry/models/helper/recipe_helper.dart';
import 'package:hungry/views/screens/profile_page.dart';
import 'package:hungry/models/core/recipe.dart';
import '../widgets/texto_motivacional.dart';
import 'package:flutter/material.dart';
import '../widgets/treinos.dart';

class HomePage extends StatelessWidget {
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;
  final List<Recipe> recommendationRecipe = RecipeHelper.recommendationRecipe;
  final List<Recipe> newlyPostedRecipe = RecipeHelper.newlyPostedRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Bora Treinar?',
            style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w700)),
        showProfilePhoto: true,
        profilePhoto: AssetImage('assets/images/pp.png'),
        profilePhotoOnPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 200,
            child: TextoMotivacional(),
          ),
          Container(
            height: 1750,
            child: Treinos(
              exercises: {
                'A': [
                  {'title': 'Exercise 1', 'subtitle': '3 sets of 10 reps'},
                  {'title': 'Exercise 2', 'subtitle': '3 sets of 8 reps'},
                ],
                'B': [
                  {'title': 'Exercise 3', 'subtitle': '3 sets of 10 reps'},
                  {'title': 'Exercise 4', 'subtitle': '3 sets of 8 reps'},
                ],
              },
              diets: {
                'breakfast': [
                  {'title': 'Food 1', 'subtitle': '300g'},
                  {'title': 'Food 2', 'subtitle': '200g'},
                ],
                'postWorkout': [
                  {'title': 'Food 3', 'subtitle': '100g'},
                  {'title': 'Food 4', 'subtitle': '150g'},
                ],
              },
            ),
          ),
        ],
      ),
    );
  }
}
