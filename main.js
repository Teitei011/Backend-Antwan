const express = require('express');
const { json } = require('body-parser');
const { updateUser, deleteUser, insertUser } = require('./utilities/db.js');


// const ObjectId = _ObjectId;
const app = express();
const port = 3000;

app.use(json());

app.get('/users/:id', async (req, res) => {
  const client = await MongoClient.connect(uri, { useNewUrlParser: true });
  const db = client.db('exercise-diet-tracker');
  const users = db.collection('users');
  const user = await users.findOne({ _id: ObjectId(req.params.id) });
  client.close();
  res.json(user);
});

app.put('/users/:id', async (req, res) => {
  const userId = req.params.id;
  const updatedUser = req.body;
  await updateUserFromDB(userId, updatedUser);
  res.sendStatus(200);
});

app.delete('/users/:id', async (req, res) => {
  const userId = req.params.id;
  await deleteUserFromDB(userId);
  res.sendStatus(200);
});

app.post('/users', async (req, res) => {
  const user = req.body;
  await insertUserFromDB(user);
  res.sendStatus(200);
});

app.listen(port, () => {
  console.log(`API listening at http://localhost:${port}`);
});
