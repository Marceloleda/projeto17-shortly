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
export async function getIdURL(req, res){
    const {id} = req.params;
    try{
        const {rows: urls} = await db.query
        (`SELECT urls.id, shorturls."shortURL", urls.url  
        FROM urls 
        JOIN shorturls
        ON shorturls.id = urls."shortUrlId"
        WHERE urls.id = $1
        ;`,[id])

        if(!id || urls.length === 0){
            return res.sendStatus(404)
        }
        res.status(200).send(urls)
    }
    catch(error){
        console.log(error.message)
        return res.sendStatus(500);
    }
}
export async function openURL(req, res){
    const {shortUrl} = req.params;
    try{
        const {rows: linkData} = await db.query(`
        SELECT urls.id, urls."shortUrlId", shorturls."shortURL", urls.url,  shorturls."visitCount"  
        FROM urls 
        JOIN shorturls
        ON shorturls.id = urls."shortUrlId"
        WHERE shorturls."shortURL" = $1
        ;
        `, [shortUrl])

        if (!linkData.length) {
            return res.status(404).send('Short URL not found');
        }
        const id = linkData[0].shortUrlId;
        const url = linkData[0].url;
        await db.query(`UPDATE shorturls SET "visitCount" = "visitCount" + 1 WHERE id = $1;`,
        [id])
        res.redirect(url);
    }
    catch(error){
        console.log(error.message)
        return res.sendStatus(500);
    }
}
export async function deleteURL(req, res){
    const { id } = req.params;
    const user_Id = req.userId;
    try {
        const isValid = await db.query(`SELECT * FROM urls WHERE "userId" = $1;`, [user_Id]);
        const id_param = await db.query(`SELECT * FROM urls WHERE id = $1;`, [id]);

        const valid = isValid.rows[0].userId;
        const param = id_param.rows[0]?.userId;

    if (!param) {
        return res.sendStatus(404);
    }
    if (valid !== param) {
        return res.sendStatus(401);
    }

    const shorturlId = await db.query(`
        SELECT urls."userId", urls."shortUrlId"
        FROM urls 
        JOIN shorturls
        ON shorturls.id = urls."shortUrlId"
        WHERE urls.id = $1
        ;`, [id]);

    const result = await db.query(
        'DELETE FROM urls WHERE id = $1 AND "userId" = $2;',
        [id, user_Id]
    );

    if (result.rowCount === 0) {
        return res.status(404).send('URL not found');
    }
    const shorturl = shorturlId.rows[0].shortUrlId;

    await db.query(
        'DELETE FROM shorturls WHERE id = $1',
        [shorturl]
    );

    res.sendStatus(204);
    } catch (error) {
        console.log(error.message);
        return res.sendStatus(500);
    }
}