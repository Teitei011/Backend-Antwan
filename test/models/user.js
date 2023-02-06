const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  age: { type: Number, required: true },
  dateOfBirth: { type: Date, required: true },
  height: { type: Number, required: true },
  weight: { type: Number, required: true },
  exercises: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Exercise' }],
  diets: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Diet' }]
});

module.exports = mongoose.model('User', userSchema)

