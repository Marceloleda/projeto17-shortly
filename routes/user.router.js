import express from 'express';
import { getUsers } from '../controllers/user.controller.js';
import { validateToken } from '../middlewares/validateToken.middleware.js';
const router = express.Router();

router.get('/users/me', validateToken, getUsers);

export default router;