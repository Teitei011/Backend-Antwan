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

              Container(
                height: 1500,
                margin: const EdgeInsets.only(top: 20),
                child: ListView(children: [
                  Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/fitness_app/breakfast.png',
                          width: 100,
                          height: 100,
                        ),
                        Text('Café da manhã'),
                        Text('300 kcal'),
                        Column(
                          children: [
                            Text('Ovo'),
                            Text('Pão'),
                            Text('Leite'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/fitness_app/lunch.png',
                          width: 100,
                          height: 100,
                        ),
                        Text('Almoço'),
                        Text('500 kcal'),
                        Column(
                          children: [
                            Text('Arroz'),
                            Text('Feijão'),
                            Text('Carne'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/fitness_app/dinner.png',
                          width: 100,
                          height: 100,
                        ),
                        Text('Jantar'),
                        Text('400 kcal'),
                        Column(
                          children: [
                            Text('Macarrão'),
                            Text('Carne'),
                            Text('Salada'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/fitness_app/snack.png',
                          width: 100,
                          height: 100,
                        ),
                        Text('Lanche'),
                        Text('200 kcal'),
                        Column(
                          children: [
                            Text('Biscoito'),
                            Text('Leite'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
