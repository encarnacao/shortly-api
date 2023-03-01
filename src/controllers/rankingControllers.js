import { db } from "../config/database.connect.js";

async function getRanking(_, res) {
	try {
		const { rows } = await db.query(`
        SELECT
            users.id,
            users.name,
            COUNT("userLinks".*) AS "linksCount",
            SUM(links."visitCount") AS "visitCount"
        FROM
            users
            LEFT JOIN "userLinks" ON "userLinks"."userId" = users.id
            LEFT JOIN links ON links.id = "userLinks"."linkId"
        GROUP BY
            users.id
        ORDER BY
            "visitCount" DESC
        LIMIT
            10
        `);
		res.status(200).send(rows);
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

export { getRanking };
