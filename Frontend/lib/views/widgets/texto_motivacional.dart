// Um widget redondo com um texto motivacional para treinar

import 'package:flutter/material.dart';

import '../utils/AppColor.dart';

class TextoMotivacional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColor.primaryExtraSoft,
      ),
      child: Center(
        child: Text(
          'Keep pushing yourself because great things take time. Believe in your journey and trust the process.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
