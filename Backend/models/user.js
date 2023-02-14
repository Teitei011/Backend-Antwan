const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  googleId: { type: String, required: false },
  dateOfBirth: { type: Date, required: false },
  height: { type: Number, required: false },
  weight: { type: Number, required: false },
  exercises: { type: mongoose.Schema.Types.ObjectId, ref: 'Exercise' },
  diet: { type: mongoose.Schema.Types.ObjectId, ref: 'Diet' },
  admin: { type: Boolean, required: true, default: false },
});

module.exports = mongoose.model("User", userSchema);
