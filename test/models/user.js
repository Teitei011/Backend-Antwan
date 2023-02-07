const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  googleId: { type: String, required: false },
  dateOfBirth: { type: Date, required: true },
  height: { type: Number, required: true },
  weight: { type: Number, required: true },
  exercises: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Exercise' }],
  diets: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Diet' }]
});

module.exports = mongoose.model('User', userSchema)

