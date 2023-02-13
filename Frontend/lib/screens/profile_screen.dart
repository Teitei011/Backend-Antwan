import 'package:best_flutter_ui_templates/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../app_theme.dart';
import '../fitness_app/components/bottom_bar.dart';
import '../fitness_app/components/button.dart';
import '../fitness_app/fitness_app_home_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(
      {Key? key,
      required this.Nome,
      required this.Email,
      required this.dateOfBirth,
      required this.height,
      required this.weight})
      : super(key: key);
  final String Nome, Email, dateOfBirth, height, weight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                    height: 150,
                    child: Lottie.asset('assets/animation/woman_profile.json')),
                const SizedBox(height: 25),
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
                                  BottomBar(
                    animationController: animationController,
                    tabIconsList: tabIconsList,
                    press: () {},
                    tabBody: Text(''),(),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
