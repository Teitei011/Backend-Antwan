const mongoose = require("mongoose");

const dietSchema = new mongoose.Schema({
  userID : { type: String, required: true },
  breakfast: [
    {
      title: { type: String, required: true },
      subtitle: { type: String, required: true },
    },
  ],
  postWorkout: [
    {
      title: { type: String, required: true },
      subtitle: { type: String, required: true },
    },
  ],
  morningSnack: [
    {
      title: { type: String, required: true },
      subtitle: { type: String, required: true },
    },
  ],
  lunch: [
    {
      title: { type: String, required: true },
      subtitle: { type: String, required: true },
    },
  ],
  afternoonSnack: [
    {
      title: { type: String, required: true },
      subtitle: { type: String, required: true },
    },
  ],
  dinner: [
    {
      title: { type: String, required: true },
      subtitle: { type: String, required: true },
    },
  ],
  nightSnack: [
    {
      title: { type: String, required: true },
      subtitle: { type: String, required: true },
    },
  ],
});

module.exports = mongoose.model("Diet", dietSchema);
