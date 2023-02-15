import "package:flutter/material.dart";
import "package:naturalteam/app_theme.dart";
import "../models/exercise.dart";

class BodyExerciseScreen extends StatelessWidget {
  const BodyExerciseScreen({
    Key? key,
    required this.imagePath,
    required this.titleTxt,
    required this.exercises,
  }) : super(key: key);

  final String imagePath;
  final String titleTxt;
  final Exercise exercises;

  @override
  Widget build(BuildContext context) {
    final bool thereIsData = false;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Text(
                titleTxt,
                style: const TextStyle(
                  color: AppTheme.darkText,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 125,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: !thereIsData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: exercises.exercises['B']!.length,
                        itemBuilder: (context, index) {
                          final exercise = exercises.exercises['B']![index];
                          print("exercise: $exercise");
                          return Material(
                            child: ListTile(
                              title: Text(exercise['title']!),
                              subtitle: Text(exercise['subtitle']!),
                            ),
                          );
                        },
                      )
                    : Text(
                        "No Exercises",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppTheme.darkText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
