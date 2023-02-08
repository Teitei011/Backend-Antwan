const mongoose = require('mongoose');

const dietSchema = new mongoose.Schema({
  title: { type: String, required: true },
  subtitle: { type: String, required: true }
});

module.exports = mongoose.model('Diet', dietSchema);
