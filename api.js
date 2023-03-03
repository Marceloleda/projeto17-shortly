import express from "express";
import cors from 'cors';
import dotenv from 'dotenv';

import auth from "./routes/auth.router.js";
import url from "./routes/url.router.js"
import user from "./routes/user.router.js"
dotenv.config()

const api = express();
api.use(cors())
api.use(express.json())

api.use(auth)
api.use(url)
api.use(user)

const PORT = process.env.PORT || 5000;
api.listen(PORT, () => {
    console.log("Server running on port " + PORT);
  });