import 'package:naturalteam/screens/fitness_app_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/components/button.dart';
import 'package:naturalteam/fitness_app/components/sign_in_google.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Username",
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
                  child: TextField(
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
                          "Forgot Password?",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                //sign in button
                Button(
                  press: () {},
                  text: 'Sign in',
                  nextPage: FitnessAppHomeScreen(),
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
