// Make a login function to work with the login_screen.dart

// Path: lib/utils/login.dart

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<bool> Login(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("email: " + email);
  print("password: " + password);

  var link = "http://10.0.2.2:3001/login";
  var response = await http.post(Uri.parse(link),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }));

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    // await prefs.setString('token', jsonResponse['token']);

    // convert jsonResponse['user'] to string
    print("\n\n\n\n\n");
    print(jsonResponse);
    await prefs.setString("id", jsonResponse['userId']['_id']);
    await prefs.setString("name", jsonResponse['userId']['name']);

// convert a json object to a string

    print(jsonResponse['user']);
    return true;
  } else {
    return false;
  }
}

final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

bool validateEmail(String email) {
  return emailRegex.hasMatch(email);
}
