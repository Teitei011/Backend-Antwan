import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/components/bottombar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {Key? key,
      required this.name,
      required this.email,
      required this.dateOfBirth,
      required this.height,
      required this.weight,
      this.animationController})
      : super(key: key);
  final String name, email, dateOfBirth, height, weight;
  final AnimationController? animationController;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Future<void> initState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('myJsonObject');

// convert the JSON string back to a JSON object
    Map<String, dynamic> data = json.decode(jsonString!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedContainer(
                      height: 150,
                      child:
                          Lottie.asset('assets/animation/woman_profile.json'),
                      transform:
                          Matrix4.translationValues(0.0, 30 * (1.0 - 0.5), 0.0),
                      duration: Duration(seconds: 1),
                    ),
                    const SizedBox(height: 150),
                    Text(widget.name,
                        style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Text(widget.email,
                        style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Text("Data de Nascimento: " + widget.dateOfBirth,
                        style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Text("Altura: " + widget.height + " cm",
                        style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Text("Peso: " + widget.weight + " kg",
                        style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            CustomBottomBarView(),
          ],
        ),
      ),
    );
  }
}
