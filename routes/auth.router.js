import express from 'express';
import { signUp } from '../controllers/auth.controller.js';
import {validateSignUp} from '../middlewares/validateAuth.middleware.js';

const router = express.Router();

router.post('/signup', validateSignUp, signUp);

export default router;