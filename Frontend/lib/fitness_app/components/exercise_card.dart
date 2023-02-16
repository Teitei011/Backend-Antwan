import "package:flutter/material.dart";

import "../training/body_exercise_screen.dart";
import "../ui_view/area_list_view.dart";
import "../models/exercise.dart";

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.list,
    required this.animation,
    required this.animationController,
    required this.index,
  });

  final List list;
  final index;
  final Animation<double> animation;
  final AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          print("Pressed: " + list[2][index]);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BodyExerciseScreen(
                imagePath: list[1][index],
                titleTxt: list[0][index],
                exercises: exerciciosTemplate,
                exerciseType: list[2][index],
              ),
            ),
          );
        },
        child:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                list[0][index],
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),

              Image.asset(
                list[1][index],
                height: 150,
              ),
              // AreaView(
              //   imagepath: list[1][index],
              //   animation: animation,
              //   animationController: animationController!,
              // ),
            ],
          ),
        ]),
      ),
    );
  }
}
