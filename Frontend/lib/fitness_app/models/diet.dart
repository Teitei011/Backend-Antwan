class Diet {
  final List<Map<String, String>> breakfast;
  final List<Map<String, String>> postWorkout;
  final List<Map<String, String>> morningSnack;
  final List<Map<String, String>> afternoonSnack;
  final List<Map<String, String>> nightSnack;
  final List<Map<String, String>> lunch;
  final List<Map<String, String>> dinner;

  Diet({
    required this.breakfast,
    required this.postWorkout,
    required this.morningSnack,
    required this.afternoonSnack,
    required this.nightSnack,
    required this.lunch,
    required this.dinner,
  });
}

// Create a Diet example
final dietTemplate = Diet(breakfast: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], postWorkout: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], morningSnack: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], afternoonSnack: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], nightSnack: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], lunch: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], dinner: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
]);
