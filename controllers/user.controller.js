import { db } from "../database/database.connection.js";

export async function getUsers(req, res){
    const id = req.userId

    try{
        const data = await db.query(`
        SELECT JSON_BUILD_OBJECT (
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
        ) AS result
        FROM users
        JOIN urls 
            ON users.id = urls."userId"
        JOIN shorturls
            ON shorturls.id = urls."shortUrlId"
        WHERE users.id = $1
        GROUP BY users.id
        ;`, [id])
       res.status(200).send(data.rows[0].result)
    }
    catch(error){
        console.log(error.message)
        return res.sendStatus(500);
    }
}
export async function rank(req, res){
    const id = req.userId

    try{
        const data = await db.query(`
        SELECT 
		us.id,
		us.name,
		COALESCE(COUNT(u."shortUrlId"),0) as "linksCount",
		COALESCE(SUM(s."visitCount"),0) as "visitCount"
        FROM users us
        LEFT JOIN urls u
        ON u."userId" = us.id
        LEFT JOIN shorturls s
        ON s.id = u."shortUrlId"
        GROUP BY us.id
        ORDER BY "visitCount"
        DESC
        LIMIT 10;`)
       res.status(200).send(data.rows)
    }
    catch(error){
        console.log(error.message)
        return res.sendStatus(500);
    }
}
