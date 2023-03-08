import "package:flutter/material.dart";
import 'package:naturalteam/screens/home_screen.dart';
import "package:naturalteam/screens/login_screen.dart";
import "package:shared_preferences/shared_preferences.dart";

class WelcomeScreen extends StatefulWidget {
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void initState() {
    super.initState();
    verificarToken().then((value) {
      if (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

verificarToken() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("id");
  if (token == null) {
    return false;
  } else {
    return true;
  }
}
