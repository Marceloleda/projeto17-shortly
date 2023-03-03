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
    const {hashPassword, id} = req.user;
    const {password} = req.body;
    try{
        const isValid = bcrypt.compareSync(password, hashPassword) 
        if(isValid){
            const token = uuidv4();
            await db.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2);`, 
            [id, token])
            res.status(200).send({token});
        }

    }
    catch(error){
        console.log(error.message);
        return res.sendStatus(422);
    }
}

