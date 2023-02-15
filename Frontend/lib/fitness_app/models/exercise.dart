class Exercise {
  final List<Map<String, String>> A;
  final List<Map<String, String>> B;
  final List<Map<String, String>> C;
  final List<Map<String, String>> D;
  final List<Map<String, String>> E;

  Exercise({
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    required this.E,
  });
}

// template
final exerciciosTemplate = Exercise(A: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], B: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], C: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], D: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
], E: [
  {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
  {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
]);
