import "package:flutter/material.dart";
import "package:naturalteam/app_theme.dart";
import "package:naturalteam/fitness_app/components/bottombar_view.dart";
import 'package:naturalteam/fitness_app/models/exercise.dart';

class BodyExerciseScreen extends StatefulWidget {
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
  State<BodyExerciseScreen> createState() => _BodyExerciseScreenState();
}

class _BodyExerciseScreenState extends State<BodyExerciseScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool thereIsData = false;
    print("Exercises: " + widget.exercises.toString());
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
                  widget.titleTxt,
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
                    image: AssetImage(widget.imagePath),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Expanded(
              //   child: Container(
              //     child: !thereIsData
              //         ? ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: widget
              //                 .exercises.exercises[widget.exerciseType]!.length,
              //             itemBuilder: (context, index) {
              //               final exercise = widget.exercises
              //                   .exercises[widget.exerciseType]![index];
              //               return Material(
              //                 child: ListTile(
              //                   title: Text(exercise['title']!),
              //                   subtitle: Text(exercise['subtitle']!),
              //                 ),
              //               );
              //             },
              //           )
              //         : Text(
              //             "No Exercises",
              //             style: TextStyle(
              //               fontSize: 22,
              //               color: AppTheme.darkText,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //   ),
              // ),

              Expanded(child: Container()),
              Material(child: CustomBottomBarView()),
            ],
          ),
        ),
      ),
    );
  }
}
