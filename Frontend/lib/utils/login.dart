// Make a login function to work with the login_screen.dart

// Path: lib/utils/login.dart

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> Login(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("email: " + email);
  print("password: " + password);

  var http;
  var response = await http.post(Uri.parse("http://192.168.15.33:3001/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }));

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    await prefs.setString('token', jsonResponse['token']);
    print(jsonResponse['token']);
    return true;
  } else {
    return false;
  }
}

final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

bool validateEmail(String email) {
  return emailRegex.hasMatch(email);
}
