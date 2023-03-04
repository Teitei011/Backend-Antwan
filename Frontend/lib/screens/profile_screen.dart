import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:naturalteam/app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(
      {Key? key,
      required this.Nome,
      required this.Email,
      required this.dateOfBirth,
      required this.height,
      required this.weight,
      this.animationController})
      : super(key: key);
  final String Nome, Email, dateOfBirth, height, weight;
  final AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AnimatedContainer(
                  height: 150,
                  child: Lottie.asset('assets/animation/woman_profile.json'),
                  transform:
                      Matrix4.translationValues(0.0, 30 * (1.0 - 0.5), 0.0),
                  duration: Duration(seconds: 1),
                ),
                const SizedBox(height: 150),
                Text(Nome,
                    style: TextStyle(
                        color: AppTheme.darkText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Text(Email,
                    style: TextStyle(
                        color: AppTheme.darkText,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Text("Data de Nascimento: " + dateOfBirth,
                    style: TextStyle(
                        color: AppTheme.darkText,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Text("Altura: " + height + "cm",
                    style: TextStyle(
                        color: AppTheme.darkText,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Text("Peso: " + weight + "kg",
                    style: TextStyle(
                        color: AppTheme.darkText,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
