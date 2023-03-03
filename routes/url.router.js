import express from 'express';
import { createURL } from '../controllers/url.controller.js';
import { validateToken } from '../middlewares/validateToken.middleware.js';
import { validateURL } from '../middlewares/validateURL.middleware.js';
const router = express.Router();

router.post('/urls/shorten', validateToken, validateURL,createURL);
router.post('/urls/:id', validateURL,createURL);

export default router;