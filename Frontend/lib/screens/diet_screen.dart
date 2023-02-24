import 'package:naturalteam/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../app_theme.dart';
import '../fitness_app/components/button.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              // Large text in the middle saying Sign up to Bora Treinar?
              const SizedBox(height: 10),

              Text("Sua dieta",
                  style: TextStyle(
                      color: AppTheme.darkText,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
      ),
    );
  }
}
