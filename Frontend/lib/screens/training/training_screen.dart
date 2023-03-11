import 'package:naturalteam/fitness_app/components/bottombar_view.dart';
import 'package:naturalteam/fitness_app/components/exercise_card.dart';
import 'package:naturalteam/fitness_app/fitness_app_theme.dart';
import 'package:naturalteam/fitness_app/models/exercise.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  late Map<String, dynamic> _data;
  late Exercise exercises =
      Exercise(A: [], B: [], C: [], D: [], E: [], F: [], G: [], H: [], id: "");

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('data');

    if (jsonString != null) {
      setState(() {
        _data = json.decode(jsonString);
        exercises = Exercise.fromJson(_data);
      });
    }
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
                future: Future.value(_data),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      padding: EdgeInsets.only(left: 16, right: 16, top: 2),
                      children: List.generate(8, (index) {
                        return ExerciseCard(
                          index: index,
                          exercises: exercises,
                        );
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
