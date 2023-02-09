// exercises.dart
import 'package:flutter/material.dart';

class Treinos extends StatelessWidget {
  final Map<String, Set<Map<String, String>>> exercises;
  final Map<String, Set<Map<String, String>>> diets;

  Treinos({required this.exercises, required this.diets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text(
              'Exercícios',
              textAlign: TextAlign.center,
            ),
            children: exercises['exercises']!.map((exercise) {
              return ListTile(
                title: Text(
                  exercise['title']!,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  exercise['subtitle']!,
                  textAlign: TextAlign.center,
                ),
              );
            }).toList(),
          ),
          ExpansionTile(
            title: Text(
              'Comida',
              textAlign: TextAlign.center,
            ),
            children: diets['diets']!.map((diet) {
              return ListTile(
                title: Text(
                  diet['title']!,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  diet['subtitle']!,
                  textAlign: TextAlign.center,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
