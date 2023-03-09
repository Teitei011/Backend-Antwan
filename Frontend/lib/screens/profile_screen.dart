import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:naturalteam/app_theme.dart';
import 'package:naturalteam/fitness_app/components/bottombar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Map<String, dynamic>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = _loadData();
  }

  Future<Map<String, dynamic>> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('data');
    if (jsonString == null) {
      throw Exception('No data found in SharedPreferences');
    }
    return json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final data = snapshot.requireData;
            return Column(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AnimatedContainer(
                          height: 150,
                          child: Lottie.asset(
                            'assets/animation/woman_profile.json',
                          ),
                          transform: Matrix4.translationValues(
                            0.0,
                            30 * (1.0 - 0.5),
                            0.0,
                          ),
                          duration: Duration(seconds: 1),
                        ),
                        const SizedBox(height: 150),
                        Text(
                          data?["user"]["name"].toString() ?? 'N/A',
                          style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          data?["user"]["email"].toString() ?? 'N/A',
                          style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Data de Nascimento: " +
                                  data["user"]['dateOfBirth'].toString() ??
                              'N/A',
                          style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Altura: " + data["user"]['height'].toString() ??
                              'N/A' + " cm",
                          style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Peso: " + data["user"]['weight'].toString() ??
                              'N/A' + " kg",
                          style: TextStyle(
                            color: AppTheme.darkText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                CustomBottomBarView(),
              ],
            );
          },
        ),
      ),
    );
  }
}
