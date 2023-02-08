// controllers/user.js
const User = require('../models/user');
const mongoose = require('mongoose');
const Diet = require('../models/diet');

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
    if (!user) return res.status(404).json({ message: 'User not found' });
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
    admin: req.body.admin
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
    if (!user) return res.status(404).json({ message: 'User not found' });
    res.json(user);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};




exports.deleteUser = async (req, res) => {
  try {
    const user = await User.findByIdAndRemove(req.params.id);
    if (!user) return res.status(404).json({ message: 'User not found' });
    res.json({ message: 'User deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};


exports.addUserExercise = async (req, res) => {
  try {
    if (!mongoose.Types.ObjectId.isValid(req.params.id)) {
      return res.status(400).json({ message: 'Invalid user id' });
    }

    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: 'User not found' });

    user.exercises.push({
      title: req.body.title,
      subtitle: req.body.subtitle,
      link: req.body.link
    });

    const updatedUser = await user.save();
    res.json(updatedUser);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

// edit Exercise
exports.updateUserExercise = async (req, res) => {
  try {
    const user = await User.findOneAndUpdate(
      { _id: req.params.id, "exercises._id": req.params.exerciseId },
      { $set: { "exercises.$": req.body } },
      { new: true }
    );

    console.log(user); // add this line

    if (!user) return res.status(404).json({ message: 'User not found' });
    res.json(user);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};


// delete Exercise
exports.deleteUserExercise = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: 'User not found' });

    const index = user.exercises.findIndex(d => d._id.toString() === req.params.exerciseId);
    if (index === -1) return res.status(404).json({ message: 'Exercise not found' });

    user.exercises.splice(index, 1);
    await user.save();
    res.json({ message: 'Exercise deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};


// DIET
exports.addUserDiet = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ message: 'User not found' });

    const diet = new Diet({
      breakfast: req.body.breakfast,
      postWorkout: req.body.postWorkout,
      morningSnack: req.body.morningSnack,
      lunch: req.body.lunch,
      afternoonSnack: req.body.afternoonSnack,
      dinner: req.body.dinner,
      nightSnack: req.body.nightSnack
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
    if (!diet) return res.status(404).json({ message: 'Diet not found' });

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
    const user = await User.findById(req.params.id).populate('diet');
    if (!user) return res.status(404).json({ message: 'User not found' });
    res.json(user.diet);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};


exports.deleteUserDiet = async (req, res) => {
  try {
    const diet = await Diet.findByIdAndRemove(req.params.dietId);
    if (!diet) return res.status(404).json({ message: 'Diet not found' });
    res.json({ message: 'Diet deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

