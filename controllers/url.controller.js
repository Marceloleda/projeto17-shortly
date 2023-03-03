import { db } from "../database/database.connection.js";
import { nanoid } from 'nanoid'

export async function createURL(req, res){
    const id = req.userId
    const {url} = req.body;
    try{
        const shortURL = nanoid(6);
        await db.query(`INSERT INTO shortURLs ("userId", "shortURL") VALUES ($1, $2);`,
        [id, shortURL])

        const {rows: idShort} = await db.query(`SELECT id, "shortURL" FROM shortUrls WHERE "userId" = $1 ORDER BY id DESC LIMIT 1;`, [id])
        
        await db.query(`INSERT INTO urls ("userId", url, "shortUrlId") VALUES ($1, $2, $3);`, 
        [id, url, idShort[0].id])
        res.status(201).send(idShort[0])
        
    }
    catch(error){
        console.log(error.message)
        return res.sendStatus(422);
    }
}