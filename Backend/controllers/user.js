// controllers/user.js
const User = require("../models/user");
const Exercise = require("../models/exercise");
const mongoose = require("mongoose");
const Diet = require("../models/diet");


exports.signUp = async (req, res) => {
  try {
    // Retrieve user input from the request body
    const { email, password, name } = req.body;

    // Validate user input
    if (!email || !password || !name) {
      return res.status(400).json({ message: "All fields are required." });
    }

    // Check if the email already exists in the database
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(409).json({ message: "Email already in use." });
    }
    // Create a new user document
    const user = new User({ email, password, name });
    await user.save();

    // Return the generated token to the client
    return res.status(201).json({ token });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};




exports.login = async (req, res) => {
  const { email, password } = req.body;

  return res.status(200).json({ email});

};




exports.getUsers = async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.getUser = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: "User not found" });
    res.json(user);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.createUser = async (req, res) => {
  const user = new User({
    name: req.body.name,
    email: req.body.email,
    password: req.body.password,
    googleId: req.body.googleId,
    dateOfBirth: req.body.dateOfBirth,
    // height: req.body.height,
    // weight: req.body.weight,
    // exercises: req.body.exercises,
    // diet: req.body.diet,
    admin: req.body.admin,
  });

  try {
    const newUser = await user.save();
    res.status(201).json(newUser);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.updateUser = async (req, res) => {
  try {
    const user = await User.findByIdAndUpdate(
      req.params.id,
      { $set: req.body },
      { new: true }
    );
    if (!user) return res.status(404).json({ message: "User not found" });
    res.json(user);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};



exports.deleteUser = async (req, res) => {
  //delete diet and exercise first, then delete user
  try {
      const user = await User.findById(req.params.id);

      if (!user) return res.status(404).json({ message: "User not found" });

      const diet = await Diet.findById(user.diet);
      const exercise = await Exercise.findById(user.exercises);

      if(diet) await diet.remove();
      if(exercise) await exercise.remove();
      await user.remove();

      res.json({ message: "User deleted" });

    } catch (err) {
      res.status(500).json({ message: err.message });
    }
};





exports.getUserExercise = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: "User not found" });
    const exercise = await Exercise.findById(user.exercises);
    res.json(exercise);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};



exports.addUserExercise = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: "User not found" });

    const exercise = new Exercise({
      userID : req.params.id,
      A: req.body.A,
      B: req.body.B,
      C: req.body.C,
      D: req.body.D,
      E: req.body.E,
      F: req.body.F,
      G: req.body.G,
      H: req.body.H,
    });

    await exercise.save();
    user.exercises = exercise._id;
    await user.save();

    res.json(user);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.updateUserExercise = async (req, res) => {
  try {
    const exercise = await Exercise.findById(req.params.exerciseId);
    if (!exercise)
      return res.status(404).json({ message: "Exercise not found" });

    exercise.A = req.body.A;
    exercise.B = req.body.B;
    exercise.C = req.body.C;
    exercise.D = req.body.D;
    exercise.E = req.body.E;
    exercise.F = req.body.F;
    exercise.G = req.body.G;
    exercise.H = req.body.H;

    await exercise.save();
    res.json(exercise);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.deleteUserExercise = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: "User not found" });

    const exercise = await Exercise.findById(user.exercises);
    if (!exercise)
      return res.status(404).json({ message: "Exercise not found" });

    await exercise.remove();
    user.exercises = null;
    await user.save();
    

  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// DIET
exports.addUserDiet = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: "User not found" });

    const diet = new Diet({
      userID : req.params.id,
      breakfast: req.body.breakfast,
      postWorkout: req.body.postWorkout,
      morningSnack: req.body.morningSnack,
      lunch: req.body.lunch,
      afternoonSnack: req.body.afternoonSnack,
      dinner: req.body.dinner,
      nightSnack: req.body.nightSnack,
    });

    await diet.save();

    user.diet = diet._id;
    await user.save();

    res.json(user);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

// edit Diet

exports.updateUserDiet = async (req, res) => {
  try {
    const diet = await Diet.findById(req.params.dietId);
    if (!diet) return res.status(404).json({ message: "Diet not found" });

    diet.breakfast = req.body.breakfast;
    diet.postWorkout = req.body.postWorkout;
    diet.morningSnack = req.body.morningSnack;
    diet.lunch = req.body.lunch;
    diet.afternoonSnack = req.body.afternoonSnack;
    diet.dinner = req.body.dinner;
    diet.nightSnack = req.body.nightSnack;

    await diet.save();
    res.json(diet);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.getUserDiet = async (req, res) => {
  try {
    const user = await User.findById(req.params.id).populate("diet");
    if (!user) return res.status(404).json({ message: "User not found" });
    res.json(user.diet);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.deleteUserDiet = async (req, res) => {
  try {
    const diet = await Diet.findByIdAndRemove(req.params.dietId);
    if (!diet) return res.status(404).json({ message: "Diet not found" });
    res.json({ message: "Diet deleted" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
