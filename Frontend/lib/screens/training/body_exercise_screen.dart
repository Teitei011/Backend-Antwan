import "package:flutter/material.dart";
import "package:naturalteam/app_theme.dart";
import "package:naturalteam/fitness_app/components/bottombar_view.dart";
import 'package:naturalteam/fitness_app/models/exercise.dart';

class BodyExerciseScreen extends StatelessWidget {
  const BodyExerciseScreen({
    Key? key,
    required this.imagePath,
    required this.titleTxt,
    required this.exercises,
    required this.exerciseType,
  }) : super(key: key);

  final String imagePath;
  final String titleTxt;
  final Exercise exercises;
  final String exerciseType;

  @override
  Widget build(BuildContext context) {
    final bool thereIsData = false;

    print("Tamanho da lista:  $exercises.exercises[exerciseType]!.length");

    return SafeArea(
      child: Container(
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
                    decoration: TextDecoration.none,
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
                          itemCount: exercises.exercises[exerciseType]!.length,
                          itemBuilder: (context, index) {
                            final exercise =
                                exercises.exercises[exerciseType]![index];
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
              Material(child: CustomBottomBarView()),
            ],
          ),
        ),
      ),
    );
  }
}
