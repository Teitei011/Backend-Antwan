import "package:http";

class ExerciseApi {
  static Future getExercises() async {
    var url = "https://wger.de/api/v2/exercise/?format=json";
    var response = await http.get(url);
    return json.decode(response.body);
  }
}
