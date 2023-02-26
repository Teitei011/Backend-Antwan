import 'package:flutter/material.dart';
import '../../app_theme.dart';

class MinhaDieta extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const MinhaDieta(
      {required super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: AppTheme.notWhite,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: AppTheme.darkText,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(subtitle,
              style: TextStyle(
                  color: AppTheme.darkText,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ));
  }
}
