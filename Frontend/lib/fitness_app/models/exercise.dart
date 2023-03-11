class Exercise {
  final id;
  final List<dynamic> A;
  final List<dynamic> B;
  final List<dynamic> C;
  final List<dynamic> D;
  final List<dynamic> E;
  final List<dynamic> F;
  final List<dynamic> G;
  final List<dynamic> H;

  Exercise(
      {required this.id,
      required this.A,
      required this.B,
      required this.C,
      required this.D,
      required this.E,
      required this.F,
      required this.G,
      required this.H});

  // convert json to object
  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      A: json['A'],
      B: json['B'],
      C: json['C'],
      D: json['D'],
      E: json['E'],
      F: json['F'],
      G: json['G'],
      H: json['H'],
    );
  }
}



// template
// final exerciciosTemplate = Exercise(
//   exercises: {
//     'A': [
//       {
//         "title": "Aquecer o manguito rotador  1",
//         "subtitle": "3x15 rep, sem intervalo"
//       },
//       {
//         "title": "Sunpino inclinado halter 5x",
//         "subtitle": "progressão de carga 15/12/10/8/8"
//       },
//       {
//         "title": "Supino inclinado máquina 4x",
//         "subtitle": "progressão de carga 15/12/10/8"
//       },
//       {"title": "Supino reto halter", "subtitle": "1 série com peso máximo"},
//       {"title": "Cross Over 4x", "subtitle": "10-12"},
//       {"title": "Peck Deck 3x", "subtitle": "drop set 100% peso 70% 50%"}
//     ],
//     'B': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"},
//       {"title": "Exercćcio 3", "subtitle": "Descrição do exercício 3"},
//       {"title": "Exercício 4", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 5", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 6", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 7", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 8", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 9", "subtitle": "Descrição do exercício 4"},
//     ],
//     'C': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'D': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'E': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'F': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'G': [
//       {"title": "Gluteo 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'H': [
//       {"title": "Abdominal 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//   },
// );



// class Exercise {
//   Map<String, List<ExerciseItem>> exercises;

//   Exercise({required this.exercises});

//   factory Exercise.fromJson(Map<String, dynamic> json) {
//     final exercisesJson = json['exercises'] as Map<String, dynamic>;
//     final exercises = <String, List<ExerciseItem>>{};

//     exercisesJson.forEach((key, value) {
//       final exerciseList = (value as List)
//           .map((exerciseJson) => ExerciseItem.fromJson(exerciseJson))
//           .toList();
//       exercises[key] = exerciseList;
//     });

//     return Exercise(exercises: exercises);
//   }
// }

// class ExerciseItem {
//   String title;
//   String subtitle;

//   ExerciseItem({required this.title, required this.subtitle});

//   factory ExerciseItem.fromJson(Map<String, dynamic> json) {
//     return ExerciseItem(
//       title: json['title'] as String,
//       subtitle: json['subtitle'] as String,
//     );
//   }
// }

// // template
// final exerciciosTemplate = Exercise(
//   exercises: {
//     'A': [
//       {
//         "title": "Aquecer o manguito rotador  1",
//         "subtitle": "3x15 rep, sem intervalo"
//       },
//       {
//         "title": "Supino inclinado halter 5x",
//         "subtitle": "progressão de carga 15/12/10/8/8"
//       },
//       {
//         "title": "Supino inclinado máquina 4x",
//         "subtitle": "progressão de carga 15/12/10/8"
//       },
//       {"title": "Supino reto halter", "subtitle": "1 série com peso máximo"},
//       {"title": "Cross Over 4x", "subtitle": "10-12"},
//       {"title": "Peck Deck 3x", "subtitle": "drop set 100% peso 70% 50%"}
//     ],
//     'B': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"},
//       {"title": "Exercćcio 3", "subtitle": "Descrição do exercício 3"},
//       {"title": "Exercício 4", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 5", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 6", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 7", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 8", "subtitle": "Descrição do exercício 4"},
//       {"title": "Exercício 9", "subtitle": "Descrição do exercício 4"},
//     ],
//     'C': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'D': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'E': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'F': [
//       {"title": "Exercício 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'G': [
//       {"title": "Gluteo 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//     'H': [
//       {"title": "Abdominal 1", "subtitle": "Descrição do exercício 1"},
//       {"title": "Exercicio 2", "subtitle": "Descrição do exercício 2"}
//     ],
//   },
// );
