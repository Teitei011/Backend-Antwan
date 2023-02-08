const express = require('express');
const router = express.Router();
const userController = require('./controllers/user');
const dietController = require('./controllers/diet');
const exerciseController = require('./controllers/exercise');

// User routes
router.get('/users', userController.getUsers);
router.get('/user/:id', userController.getUser);
router.post('/user', userController.createUser);
router.patch('/user/:id', userController.updateUser);
router.delete('/user/:id', userController.deleteUser);

// user exercises routes 

// router.get('/user/:id/exercise', userController.getUserDiets);
router.post('/user/:id/exercise', userController.addUserExercise);
router.patch('/user/:id/exercise/:exerciseId', userController.updateUserExercise);
router.delete('/user/:id/exercise/:exerciseId', userController.deleteUserExercise);


// user diets routes
// router.get('/user/:id/diets', userController.getUserDiets);
router.post('/user/:id/diet', userController.addUserDiet);
router.patch('/user/:id/diet/:dietId', userController.updateUserDiet);
router.delete('/user/:id/diet/:dietID', userController.deleteUserDiet);

// Diet routes
router.get('/diets', dietController.getDiets);
router.get('/diet/:id', dietController.getDiet);
router.post('/diet', dietController.createDiet);
router.patch('/diet/:id', dietController.updateDiet);
router.delete('/diet/:id', dietController.deleteDiet);

// Exercise routes
router.get('/exercises', exerciseController.getExercises);
router.get('/exercise/:id', exerciseController.getExercise);
router.post('/exercise', exerciseController.createExercise);
router.patch('/exercise/:id', exerciseController.updateExercise);
router.delete('/exercise/:id', exerciseController.deleteExercise);

module.exports = router;
