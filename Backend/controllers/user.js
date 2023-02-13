// controllers/user.js
const User = require("../models/user");
const Exercise = require("../models/exercise");
const mongoose = require("mongoose");
const Diet = require("../models/diet");
const bcrypt = require("bcryptjs");


exports.signup = async (req, res) => {
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

    // Hash the password before storing it in the database
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user document
    const user = new User({ email, password: hashedPassword, name });
    await user.save();

    // Generate a JSON web token for the newly created user
    const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET);

    // Return the generated token to the client
    return res.status(201).json({ token });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};




exports.login = async (req, res) => {
  const { email, password } = req.body;

  try {
    // Validate user input (email, password)
    // ...
    // Call the database to check if the user exists and the password matches
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ error: "User not found" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ error: "Password is incorrect" });
    }

    // Create a JWT token and return it to the client
    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, {
      expiresIn: 3600,
    });

    return res.json({
      token,
      user: {
        id: user._id,
        name: user.name,
        email: user.email,
      },
    });
  } catch (error) {
    console.error(error.message);
    return res.status(500).json({ error: "Server error" });
  }
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
    height: req.body.height,
    weight: req.body.weight,
    exercises: req.body.exercises,
    diet: req.body.diet,
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
  try {
    const user = await User.findByIdAndRemove(req.params.id);
    if (!user) return res.status(404).json({ message: "User not found" });
    res.json({ message: "User deleted" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.addUserExercise = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: "User not found" });

    const exercise = new Exercise({
      A: req.body.A,
      B: req.body.B,
      C: req.body.C,
      D: req.body.D,
      E: req.body.E,
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

    await exercise.save();
    res.json(exercise);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.deleteUserExercise = async (req, res) => {
  try {
    const exercise = await Exercise.findByIdAndRemove(req.params.exerciseId);
    if (!exercise)
      return res.status(404).json({ message: "Exercise not found" });
    res.json({ message: "Exercise deleted" });
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
