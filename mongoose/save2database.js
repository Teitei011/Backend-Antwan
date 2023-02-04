const mongodb = require('mongodb');
const MongoClient = mongodb.MongoClient;
const ObjectId = mongodb.ObjectId;
const uri = "mongodb+srv://<username>:<password>@cluster0.mongodb.net/test?retryWrites=true&w=majority";

const insertUser = async (user) => {
  const client = await MongoClient.connect(uri, { useNewUrlParser: true });
  const db = client.db('exercise-diet-tracker');
  const users = db.collection('users');
  await users.insertOne(user);
  client.close();
};

const user = new User('John Doe');
user.addExercise('Chest workout', '3 sets of 10 reps', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ');
user.addDiet('Healthy breakfast', 'Oatmeal with fruit and nuts');

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

// Example usage:
const userId = '5f5f5a4b4b4b4b4b4b4b4b4b';

// Update user
const updatedUser = { exercises: [{ title: 'Back workout', subtitle: '3 sets of 10 reps', video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' }] };
updateUser(userId, updatedUser);

// Delete user
deleteUser(userId);
