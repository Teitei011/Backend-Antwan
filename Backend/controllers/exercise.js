const Exercise = require('../models/exercise');

exports.getExercises = async (req, res) => {
  try {
    const exercises = await Exercise.find();
    res.json(exercises);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.getExercise = async (req, res) => {
  try {
    const exercise = await Exercise.findById(req.params.id);
    if (!exercise) return res.status(404).json({ message: 'Exercise not found' });
    res.json(exercise);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.createExercise = async (req, res) => {
  const exercise = new Exercise({
    title: req.body.title,
    subtitle: req.body.subtitle,
    link: req.body.link
  });

  try {
    const newExercise = await exercise.save();
    res.status(201).json(newExercise);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.updateExercise = async (req, res) => {
  try {
    const exercise = await Exercise.findByIdAndUpdate(
      req.params.id,
      { $set: req.body },
      { new: true }
    );

    if(!exercise ) return res.status(404).json({ message: 'Exercise not found' });
    res.json(exercise);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};


exports.deleteExercise = async (req, res) => {
  try {
    const exercise = await Exercise.findByIdAndRemove(req.params.id);
    if (!exercise) return res.status(404).json({ message: 'Exercise not found' });
    res.json({ message: 'Exercise deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

