const { default: mongoose } = require("mongoose");
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

module.exports = mongoose.model("Diet", dietSchema);