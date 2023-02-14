import "package:flutter/material.dart";
import "package:naturalteam/app_theme.dart";

class BodyExerciseScreen extends StatelessWidget {
  const BodyExerciseScreen({
    Key? key,
    required this.imagePath,
    required this.titleTxt,
  }) : super(key: key);

  final String imagePath;
  final String titleTxt;

  @override
  Widget build(BuildContext context) {
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
            const Expanded(
              child: Center(
                child: Text(
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
