class User {
  constructor(name, age, gender, height) {
    this.name = name;
    this.age = age;
    this.gender = gender;
    this.height = height;
    this.weight = [];
    this.startDate = new Date();
    this.exercises = [];
    this.diets = [];
    this.admin = false;
  }

  addExercise(title, subtitle, videoLink) {
    this.exercises.push({
      title,
      subtitle,
      videoLink
    });
  }

  editExercise(index, title, subtitle, videoLink) {
    this.exercises[index] = {
      title,
      subtitle,
      videoLink
    };
  }

  deleteExercise(index) {
    this.exercises.splice(index, 1);
  }

  addDiet(title, subtitle) {
    this.diets.push({
      title,
      subtitle
    });
  }

  editDiet(index, title, subtitle) {
    this.diets[index] = {
      title,
      subtitle
    };
  }

  deleteDiet(index) {
    this.diets.splice(index, 1);
  }

  addWeight(weight) {
    this.weight.push({
      weight,
      date: new Date()
    });
  }

  editWeight(index, weight) {
    this.weight[index] = {
      weight,
      date: new Date()
    };
  }

  deleteWeight(index) {
    this.weight.splice(index, 1);
  }
}
