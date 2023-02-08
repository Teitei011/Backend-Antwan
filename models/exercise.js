const mongoose = require("mongoose");

const exerciseSchema = new mongoose.Schema({
  A: [
    {
      title: { required: true, type: String },
      subtitle: { required: true, type: String },
    },
  ],
  B: [
    {
      title: { required: true, type: String },
      subtitle: { required: true, type: String },
    },
  ],
  C: [
    {
      title: { required: true, type: String },
      subtitle: { required: true, type: String },
    },
  ],
  D: [
    {
      title: { required: true, type: String },
      subtitle: { required: true, type: String },
    },
  ],
  E: [
    {
      title: { required: true, type: String },
      subtitle: { required: true, type: String },
    },
  ],
});

module.exports = mongoose.model("Exercise", exerciseSchema);

module.exports = mongoose.model("Exercise", exerciseSchema);
