import { db } from "../config/database.connect.js";

async function validateShortUrl(req, res, next) {
	const { shortUrl } = req.params;
	try {
		const url = await db.query(
			`SELECT * FROM links WHERE "shortUrl" = $1`,
			[shortUrl]
		);
		if (url.rowCount === 0) {
			return res.status(404).send("Not Found");
		}
		res.locals.url = url.rows[0];
		next();
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

async function validateId(req, res, next) {
	const { id } = req.params;
	try {
		const url = await db.query(`SELECT id,"shortUrl",url FROM links WHERE id = $1`, [id]);
		if (url.rowCount === 0) {
			return res.status(404).send("Not Found");
		}
		res.locals.url = url.rows[0];
		next();
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

export { validateShortUrl, validateId };
