class Exercise {
  final Map<String, List<Map<String, String>>> exercises;

  Exercise({
    required this.exercises,
  });
}

// template
final exerciciosTemplate = Exercise(
  exercises: {
    'A': [
      {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
      {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
    ],
    'B': [
      {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
      {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"},
      {"title": "Exercćcio 3", "subtitle": "Descrição do exercício 3"},
      {"title": "Exercício 4", "subtitle": "Descrição do exercício 4"},
      {"title": "Exercício 5", "subtitle": "Descrição do exercício 4"},
      {"title": "Exercício 6", "subtitle": "Descrição do exercício 4"},
      {"title": "Exercício 7", "subtitle": "Descrição do exercício 4"},
      {"title": "Exercício 8", "subtitle": "Descrição do exercício 4"},
      {"title": "Exercício 9", "subtitle": "Descrição do exercício 4"},
    ],
    'C': [
      {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
      {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
    ],
    'D': [
      {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
      {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
    ],
    'E': [
      {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
      {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
    ],
  },
);
