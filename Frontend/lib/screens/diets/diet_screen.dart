import 'package:flutter/material.dart';
import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/bottom_navigation_view/bottom_bar_view.dart';
import 'package:naturalteam/fitness_app/components/bottombar_view.dart';

class MinhaDieta extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const MinhaDieta(
      {required super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle});

  @override
  State<MinhaDieta> createState() => _MinhaDietaState();
}

class _MinhaDietaState extends State<MinhaDieta> {
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
          Text(widget.title,
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
            widget.imagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(widget.subtitle,
              style: TextStyle(
                  color: AppTheme.darkText,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: Container(),
          ),
          Material(child: CustomBottomBarView()),
        ],
      ),
    ));
  }
}
