const { default: mongoose } = require("mongoose");
const Exercise = require("./Exercise");
const Diet = require("./Diet");

require("mongoose");
const { Schema, model } = mongoose;

const userSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  dateofBirth: {
    type: Date,
    required: true,
  },

  gender: {
    type: String,
    required: true,
  },
  height: {
    type: String,
    required: true,
  },
  weight: {
    type: String,
    required: true,
  },
  startDate: {
    type: Date,
    default: Date.now,
    required: true,
  },
  exercises: [
    {
      type: Schema.Types.ObjectId,
      ref: "Exercise",
    },
  ],
  diets: [
    {
      type: Schema.Types.ObjectId,
      ref: "Diet",
    },
  ],

  admin: {
    type: Boolean,
    required: true,
  },
});

module.exports = mongoose.model("User", userSchema);

//create template of the user
