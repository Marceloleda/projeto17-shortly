import { urlSchema } from "../models/schemas.model.js";

export async function validateURL(req, res, next){
    try{
        const validation = urlSchema.validate(req.body, {abortEarly: false});
  
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