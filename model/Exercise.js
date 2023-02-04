import mongoose from "mongoose";
const { Schema, model } = mongoose;

const exerciseSchema = new Schema({
    title: {
        type: String,
        required: true,
    },
    subtitle: {
        type: String,
        required: true,
    },
    video: {
        type: String,
        required: false,
    },
})

const Exercise = model("Exercise", exerciseSchema);
export default Exercise;
