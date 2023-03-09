import 'package:shared_preferences/shared_preferences.dart';

// Clear SharedPreferences
clearSharedPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}
