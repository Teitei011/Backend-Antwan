const express = require('express');
const mongoose = require('mongoose');
const Diet = require('./models/diet');
const Exercise = require('./models/exercise');
const User = require('./models/user');

const app = express();
app.use(express.json());

mongoose.connect(<MONGODB_URI>, { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true });
const db = mongoose.connection;
db.once('open', () => console.log('Connected to MongoDB!'));
db.on('error', (error) => console.error(error));

// Get all users
app.get('/users', (req, res) => {
  User.find()
    .populate('exercises')
    .populate('diets')
    .then(users => res.json(users))
    .catch(err => res.status(400).json('Error: ' + err));
});

// Get a single user by id
app.get('/users/:id', (req, res) => {
  User.findById(req.params.id)
    .populate('exercises')
    .populate('diets')
    .then(user => res.json(user))
    .catch(err => res.status(400).json('Error: ' + err));
});

// Create a new user
app.post('/users', (req, res) => {
  const newUser = new User({
    name: req.body.name,
    age: req.body.age,
    dateOfBirth: req.body.dateOfBirth,
    height: req.body.height,
    weight: req.body.weight
  });
  newUser.save()
    .then(() => res.json('User added!'))
    .catch(err => res.status(400).json('Error: ' + err));
});

const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`Server running on port ${port}`));
