import express from "express";
import cors from 'cors';
import dotenv from 'dotenv';
import auth from "./routes/auth.router.js";
dotenv.config()

const api = express();
api.use(cors())
api.use(express.json())

api.use(auth)

const PORT = process.env.PORT || 5000;
api.listen(PORT, () => {
    console.log("Server running on port " + PORT);
  });