const Diet = require('../models/diet');

exports.getDiets = async (req, res) => {
  try {
    const diets = await Diet.find();
    res.json(diets);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.getDiet = async (req, res) => {
  try {
    const diet = await Diet.findById(req.params.id);
    if (!diet) return res.status(404).json({ message: 'Diet not found' });
    res.json(diet);
  } catch (err){
    res.status(500).json({ message: err.message });
  }
}

exports.createDiet = async (req, res) => {
  const diet = new Diet({
    title: req.body.title,
    subtitle: req.body.subtitle
  });

  try {
    const newDiet = await diet.save();
    res.status(201).json(newDiet);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.updateDiet = async (req, res) => {
  try {
    const diet = await Diet.findByIdAndUpdate(
      req.params.id,
      { $set: req.body },
      { new: true }
    );
    if (!diet) return res.status(404).json({ message: 'Diet not found' });
    res.json(diet);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.deleteDiet = async (req, res) => {
  try {
    const diet = await Diet.findByIdAndRemove(req.params.id);
    if (!diet) return res.status(404).json({ message: 'Diet not found' });
    res.json({ message: 'Diet deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

