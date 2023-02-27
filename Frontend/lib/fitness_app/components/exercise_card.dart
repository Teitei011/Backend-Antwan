import "package:flutter/material.dart";
import "package:naturalteam/app_theme.dart";
import '../../screens/training/body_exercise_screen.dart';
import "../models/exercise.dart";

List list = [
  [
    'Costas',
    'Ombro',
    'Biceps, Triceps',
    'Peito',
    'Perna',
    'Panturrilha',
    'Gluteo',
    "Abdômen"
  ],
  [
    'assets/images/back.png',
    'assets/images/back2.png',
    'assets/images/biceps.png',
    'assets/images/chest.png',
    'assets/images/leg.png',
    'assets/images/calf.png',
    'assets/images/glute.png',
    'assets/images/abdomen.png'
  ],
  ["A", "B", "C", "D", "E", "F", "G", "H"]
];

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BodyExerciseScreen(
              imagePath: list[1][index],
              titleTxt: list[0][index],
              exercises: Exercise(exercises: exerciciosTemplate.exercises),
              exerciseType: list[2][index],
            ),
          ),
        )
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: AppTheme.nearlyWhite,
            child: Column(
              children: [
                Text(
                  list[0][index],
                  style: TextStyle(
                    color: AppTheme.darkText,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  list[1][index],
                  width: 175,
                  height: 175,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
