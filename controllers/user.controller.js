import { db } from "../database/database.connection.js";

export async function getUsers(req, res){
    const id = req.userId

    try{
        const data = await db.query(`
        SELECT 
        JSON_BUILD_OBJECT (
            'id', users.id,
            'name', users.name,
            'visitCount', SUM(shorturls."visitCount"),
            'shortenedUrls', JSON_AGG(
                JSON_BUILD_OBJECT(
                    'id', shorturls.id,
                    'shortUrl', shorturls."shortURL",
                    'url', urls.url,
                    'visitCount', shorturls."visitCount"
                )
            )
        )
        FROM users
        JOIN urls 
        ON users.id = urls."userId"
        JOIN shorturls
        ON shorturls.id = urls."shortUrlId"
        WHERE users.id = $1
        GROUP BY users.id
        ;`, [id])
       res.status(200).send(data.rows[0])
    }
    catch(error){
        console.log(error.message)
        return res.sendStatus(500);
    }
}