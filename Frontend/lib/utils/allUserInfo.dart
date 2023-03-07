import 'dart:convert';
import 'package:naturalteam/fitness_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

const String url = "http://192.168.15.33:3001" + "/user/all/"; //:id;

// make a function to get use the api

Future<List<dynamic>> fetchUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");
  final userString = prefs.getString("user");

// convert userString to user
  final user = User.fromJson(jsonDecode(userString!));

  print("Token: " + token!);
  print("User: " + user.name);

  final response = await http.get(Uri.parse(url + user._id),
      headers: {'Authorization': 'Bearer $token'});

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    final data = jsonDecode(response.body) as List;
    return data;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load data');
  }
}
