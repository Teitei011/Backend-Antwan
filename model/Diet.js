import mongoose from "mongoose";
const { Schema, model } = mongoose;

const dietSchema = new Schema({
    title: {
        type: String,
        required: true,
    },
    subtitle: {
        type: String,
        required: true,
    },
})

const Diet = model("Diet", dietSchema);
export default Diet;
