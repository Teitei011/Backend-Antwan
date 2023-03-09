import 'dart:convert';

import 'package:naturalteam/fitness_app/components/bottombar_view.dart';
import 'package:naturalteam/fitness_app/components/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:naturalteam/fitness_app/fitness_app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  Future<Map<String, dynamic>>? _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = _getData();
  }

  Future<Map<String, dynamic>> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('data');

    return json.decode(jsonString!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: FitnessAppTheme.background,
        child: Column(
          children: [
            Text(
              "Treinamento",
              style: TextStyle(
                color: FitnessAppTheme.darkText,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                future: _dataFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      padding: EdgeInsets.only(left: 16, right: 16, top: 2),
                      children: List.generate(8, (index) {
                        return ExerciseCard(index: index);
                      }),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            CustomBottomBarView(),
          ],
        ),
      ),
    );
  }
}
