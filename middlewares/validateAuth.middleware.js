import { db } from "../database/database.connection.js";
import { signupSchema, signinSchema } from "../models/schemas.model.js";

export async function validateSignUp(req, res, next){
    const {body} = req  
    const {email}= req.body  
    try{
        const validation = signupSchema.validate(body, {abortEarly: false});
        const {rows: exist} = await db.query(`SELECT * FROM users WHERE email = $1;`, [email])
        if(exist.length > 0){
            return res.sendStatus(409);
        }
        if(validation.error){
            const errors = validation.error.details.map((detail)=> detail.message);
            console.log(errors)
            res.status(422).send(errors)
            return;
        }
        next();
    }
        catch(error){
            res.sendStatus(422)
            return
        }
}
export async function validateSignIn(req, res, next){
    const {body} = req  
    const {email}= req.body  
    try{
        const validation = signinSchema.validate(body, {abortEarly: false});
        const {rows: exist} = await db.query(`SELECT * FROM users WHERE email = $1;`, [email])
        if(exist.length === 0){
            return res.sendStatus(401);
        }
        if(validation.error){
            const errors = validation.error.details.map((detail)=> detail.message);
            console.log(errors)
            res.status(422).send(errors)
            return;
        }
        req.user = exist[0];
        next();
    }
        catch(error){
            res.sendStatus(422)
            return
        }
}