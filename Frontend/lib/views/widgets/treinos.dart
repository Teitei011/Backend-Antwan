import 'package:flutter/material.dart';

class Treinos extends StatefulWidget {
  final Map<String, List<Map<String, String>>> exercises;
  final Map<String, List<Map<String, String>>> diets;

  Treinos({required this.exercises, required this.diets});

  @override
  _TreinosState createState() => _TreinosState();
}

class _TreinosState extends State<Treinos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text(
              'Exercícios',
              textAlign: TextAlign.center,
            ),
            children: widget.exercises['A'] != null
                ? [
                    ...['A', 'B', 'C', 'D', 'E'].map((exerciseType) {
                      return Column(
                        children: <Widget>[
                          ...?widget.exercises[exerciseType]?.map((exercise) {
                            return ListTile(
                              title: Text(
                                exercise['title'] ?? '',
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                exercise['subtitle'] ?? '',
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    }).toList()
                  ]
                : [
                    Center(
                      child: Text('Não há exercícios'),
                    ),
                  ],
          ),
          ExpansionTile(
            title: Text(
              'Comida',
              textAlign: TextAlign.center,
            ),
            children: widget.diets['breakfast'] != null
                ? [
                    ...[
                      'breakfast',
                      'postWorkout',
                      'morningSnack',
                      'lunch',
                      'afternoonSnack',
                      'dinner',
                      'nightSnack'
                    ].map((dietType) {
                      return Column(
                        children: <Widget>[
                          ...?widget.diets[dietType]?.map((diet) {
                            return ListTile(
                              title: Text(
                                diet['title'] ?? '',
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                diet['subtitle'] ?? '',
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    }).toList()
                  ]
                : [
                    Center(
                      child: Text('Não há dietas'),
                    ),
                  ],
          ),
        ],
      ),
    );
  }
}
