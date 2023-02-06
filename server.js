import dotenv from "dotenv";
import express from "express"
import mongoose from "mongoose";
import mongodb from "mongodb";

// require("dotenv").config();
// const express = require("express");
const app = express();
// const mongoose = require("mongoose");
mongoose.set("strictQuery", false);

// const { MongoClient, ServerApiVersion } = require("mongodb");
// const db = new MongoClient(process.env.URI, { useNewUrlParser: true, useUnifiedTopology: true, serverApi: ServerApiVersion.v1 });
const MongoClient = mongodb.MongoClient;

const db = MongoClient.connect(
  process.env.DOCUMENTS_COLLECTION, 
  {poolSize: 10, wtimeout: 2500, useUnifiedTopology: true},
).catch(err => {
  console.error(err.stack)
  process.exit(1)
}).then(async client => {
  app.listen(port, () => { console.log(`Listening on port ${port}`) })});

// mongoose.connect(process.env.DATABASE_URL, {
//   useNewUrlParser: true,
//   useUnifiedTopology: true,
// });

// const db = mongoose.connection;

db.on("error", (error) => console.error(error));
db.once("open", () => console.log("Connected to Database"));

app.use(express.json());

const usersRouter = require("./routes/users");
app.use("/users", usersRouter);

app.listen(3000, () => console.log("Server Started"));
