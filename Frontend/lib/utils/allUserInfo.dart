import 'dart:convert';
import 'package:naturalteam/fitness_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

const String url = "http://10.0.2.2:3001" + "/user/all/"; //:id;

// make a function to get use the api

Future fetchUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // final token = prefs.getString("token");
  final id = prefs.getString("id");
  // prefs.clear();

// convert userString to user

  // print("Token: " + token!);
  // Replace <jwt_token> and <api_endpoint> with your values
  // final headers = {'Authorization': 'Bearer $token'};

  final response = await http.get(
    Uri.parse(url + id!),
    // headers: headers,
  );

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.

    // convert response.body to json

    return response.body;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load data');
  }
}
