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
      {
        "title": "Aquecer o manguito rotador  1",
        "subtitle": "3x15 rep, sem intervalo"
      },
      {
        "title": "Sunpino inclinado halter 5x",
        "subtitle": "progressão de carga 15/12/10/8/8"
      },
      {
        "title": "Supino inclinado máquina 4x",
        "subtitle": "progressão de carga 15/12/10/8"
      },
      {"title": "Supino reto halter", "subtitle": "1 série com peso máximo"},
      {"title": "Cross Over 4x", "subtitle": "10-12"},
      {"title": "Peck Deck 3x", "subtitle": "drop set 100% peso 70% 50%"}
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
