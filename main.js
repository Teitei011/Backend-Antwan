import express, { json } from 'express';
import { MongoClient as _MongoClient, ObjectId as _ObjectId } from 'mongodb';
import { updateUser, deleteUser, insertUser } from './utilities/db.js';


const MongoClient = _MongoClient;
const ObjectId = _ObjectId;
const app = express();
const port = 3000;
const uri = "mongodb+srv://<username>:<password>@cluster0.mongodb.net/test?retryWrites=true&w=majority";

const updateUser = async (userId, updatedUser) => {
  const client = await MongoClient.connect(uri, { useNewUrlParser: true });
  const db = client.db('exercise-diet-tracker');
  const users = db.collection('users');
  await users.updateOne({ _id: ObjectId(userId) }, { $set: updatedUser });
  client.close();
};

const deleteUser = async (userId) => {
  const client = await MongoClient.connect(uri, { useNewUrlParser: true });
  const db = client.db('exercise-diet-tracker');
  const users = db.collection('users');
  await users.deleteOne({ _id: ObjectId(userId) });
  client.close();
};

const insertUser = async (user) => {
  const client = await MongoClient.connect(uri, { useNewUrlParser: true });
  const db = client.db('exercise-diet-tracker');
  const users = db.collection('users');
  await users.insertOne(user);
  client.close();
};

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
  await updateUser(userId, updatedUser);
  res.sendStatus(200);
});

app.delete('/users/:id', async (req, res) => {
  const userId = req.params.id;
  await deleteUser(userId);
  res.sendStatus(200);
});

app.post('/users', async (req, res) => {
  const user = req.body;
  await insertUser(user);
  res.sendStatus(200);
});

app.listen(port, () => {
  console.log(`API listening at http://localhost:${port}`);
});
