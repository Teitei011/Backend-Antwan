import 'package:flutter/material.dart';
import 'package:hungry/models/core/recipe.dart';
import 'package:hungry/models/helper/recipe_helper.dart';
// import 'package:hungry/views/screens/delicious_today_page.dart';
// import 'package:hungry/views/screens/newly_posted_page.dart';
import 'package:hungry/views/screens/profile_page.dart';
// import 'package:hungry/views/screens/search_page.dart';
// import 'package:hungry/views/utils/AppColor.dart';
import 'package:hungry/views/widgets/custom_app_bar.dart';
// import 'package:hungry/views/widgets/dummy_search_bar.dart';
// import 'package:hungry/views/widgets/featured_recipe_card.dart';
// import 'package:hungry/views/widgets/recipe_tile.dart';
// import 'package:hungry/views/widgets/recommendation_recipe_card.dart';

import '../widgets/texto_motivacional.dart';
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
              child: Treinos(exercises: {
                'exercises': {
                  {'title': 'Squats', 'subtitle': '3 sets of 10 reps'},
                  {'title': 'Deadlifts', 'subtitle': '3 sets of 8 reps'},
                  {'title': 'Push ups', 'subtitle': '3 sets of 10 reps'},
                }.toSet(),
              }, diets: {
                'diets': {
                  {'title': 'Arroz', 'subtitle': '300g'},
                  {'title': 'Frango', 'subtitle': '200g'},
                }.toSet(),
              })),
        ],
      ),
    );
  }
}
