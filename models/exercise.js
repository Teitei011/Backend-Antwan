const mongoose = require('mongoose');

const exerciseSchema = new mongoose.Schema({
  title: { type: String, required: true },
  subtitle: { type: String, required: true },
  link: { type: String, required: true }
});

module.exports = mongoose.model('Exercise', exerciseSchema);

