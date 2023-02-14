const express = require('express');
const app = express();
const mongoose = require('mongoose');
const routes = require('./routes');
const dotenv = require('dotenv');

dotenv.config();

mongoose.set('strictQuery', true);


mongoose.connect(process.env.MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

app.use(express.json());
app.use(routes);

const port = process.env.PORT || 3001;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
