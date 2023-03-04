const express = require('express');
const router = express.Router();
const userController = require('./controllers/user');
const dietController = require('./controllers/diet');
const exerciseController = require('./controllers/exercise');
const authMiddleware = require('./utils/middleware/authMiddleware');

// Login route
router.post('/login', userController.login);
router.post('/signup', userController.signUp);


// User routes
router.get('/users',  authMiddleware, userController.getUsers);
router.get('/user/:id',  authMiddleware, userController.getUser);
router.post('/user', authMiddleware,  userController.createUser);
router.patch('/user/:id', authMiddleware,  userController.updateUser);
router.delete('/user/:id', authMiddleware,  userController.deleteUser);

// user exercises routes 

router.get('/user/:id/exercise/', authMiddleware,  userController.getUserExercise);
router.post('/user/:id/exercise', authMiddleware,  userController.addUserExercise);
router.patch('/exercise/:id', authMiddleware,  userController.updateUserExercise);
router.delete('/exercise/:id', authMiddleware,  userController.deleteUserExercise);


// user diets routes
router.get('/user/:id/diet', authMiddleware,  userController.getUserDiet);
router.post('/user/:id/diet', authMiddleware,  userController.addUserDiet);
router.patch('/user/:id/diet', authMiddleware,  userController.updateUserDiet);
router.delete('/user/:id/diet', authMiddleware,  userController.deleteUserDiet);

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
