import mongoose from "mongoose";
const { Schema, model } = mongoose;

const userSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  age: {
    type: Number,
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
    required: true,
  },
  
  exercises: Exercise,
  diets: Diet,

  admin: {
    type: Boolean,
    required: true,
  },
});

const User = model("User", userSchema);
export default User;
