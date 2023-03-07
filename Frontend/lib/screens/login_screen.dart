import 'dart:convert';

import 'package:naturalteam/fitness_app/components/login_button.dart';
import 'package:naturalteam/screens/fitness_app_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/components/button.dart';
import 'package:naturalteam/fitness_app/components/sign_in_google.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

const String link = 'http://localhost:3001/';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Large text in the middle saying Bora Treinar?
                const SizedBox(height: 30),

                Text("Bora Treinar?",
                    style: TextStyle(
                        color: AppTheme.darkText,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),

                const SizedBox(height: 20),

                // Icon(Icons.lock, size: 100),
                Container(
                    height: 200,
                    child: Lottie.asset('assets/animation/exercise.json')),

                const SizedBox(height: 25),
                // username textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (validateEmail(value)) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixIcon: Icon(Icons.person, color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixIcon: Icon(Icons.password, color: Colors.grey[400]),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Don't have an account?",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                //sign in button
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppTheme.darkerText,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      bool success = await Login(
                          _emailController.text, _passwordController.text);
                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FitnessAppHomeScreen()),
                        );
                      } else {
                        _emailController.clear();
                        _passwordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login failed'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                // or continue with

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                              thickness: 0.5, color: Colors.grey[400]!)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Or continue with",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 16)),
                      ),
                      Expanded(
                          child: Divider(
                              thickness: 0.5, color: Colors.grey[400]!)),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // google sign in button
                SignInGoogleButton(
                  text: "Sign in",
                  onPressed: () {},
                ),

                // bit a member? register now!
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> Login(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("email: " + email);
  print("password: " + password);
  final response = await http.post(
    Uri.parse(link + '/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

bool validateEmail(String email) {
  return emailRegex.hasMatch(email);
}
