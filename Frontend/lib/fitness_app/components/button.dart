import 'package:best_flutter_ui_templates/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../screens/signup_screen.dart';

class Button extends StatelessWidget {
  const Button(
      {required this.nextPage,
      required this.text,
      Key? key,
      required Null Function() press});
  final String text;
  final Widget nextPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        color: AppTheme.darkerText,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
