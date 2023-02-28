import { db } from "../config/database.connect.js";

async function getMyUser(_, res) {
	const { userId } = res.locals.user;
	try {
		const result = await db.query(`
            SELECT 
                users.id, 
                users.name, 
                SUM(links."visitCount") AS "visitCount", 
                JSON_AGG(JSON_BUILD_OBJECT(
                'id', links.id, 
                'shortUrl', links."shortUrl", 
                'url', links."url", 
                'visitCount', links."visitCount") ORDER BY links.id) AS shortenedUrls
            FROM 
                users
                JOIN "userLinks" ON "userLinks"."userId" = users.id
                JOIN links ON "userLinks"."linkId" = links.id
            WHERE
                users.id = $1
            GROUP BY users.id 
        `, [userId]);
        const userInfo = result.rows[0];
		res.status(200).send(userInfo);
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

export { getMyUser };
