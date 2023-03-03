import express from 'express';
import { createURL, getURL } from '../controllers/url.controller.js';
import { validateToken } from '../middlewares/validateToken.middleware.js';
import { validateURL } from '../middlewares/validateURL.middleware.js';
const router = express.Router();

router.post('/urls/shorten', validateToken, validateURL,createURL);
router.get('/urls/:id', getURL);

export default router;