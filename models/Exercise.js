const { default: mongoose } = require("mongoose");
const { Schema, model } = mongoose;

const exerciseSchema = new Schema({
    title: {
        type: String,
        required: false,
    },
    subtitle: {
        type: String,
        required: false,
    },
    video: {
        type: String,
        required: false,
    },
})

module.exports = mongoose.model("Exercise", exerciseSchema);