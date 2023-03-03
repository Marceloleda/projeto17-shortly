import { db } from "../database/database.connection.js";
import bcrypt from 'bcrypt';
import {v4 as uuidv4} from 'uuid';

export async function signUp(req, res){
    const {name, email, password} = req.body;
    const hashPassword = bcrypt.hashSync(password, 10)
    try{
        await db.query(`INSERT INTO users (name, email, "hashPassword") VALUES ($1, $2, $3);`, 
        [name, email, hashPassword]);
        res.sendStatus(201);
    }
    catch(error){
        console.log(error.message);
        return res.sendStatus(422);
    }
}

export async function signIn(req, res){
    const {email, password} = req.body;
    try{
        res.sendStatus(201);

    }
    catch(error){
        console.log(error.message);
        return res.sendStatus(422);
    }
}

