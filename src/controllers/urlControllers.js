import { nanoid } from "nanoid";
import { db } from "../config/database.connect.js";

async function shortenUrl(req, res) {
	const { url } = req.body;
	const { userId } = res.locals.user;
	try {
		const shortUrl = nanoid(8);
		const { rows } = await db.query(
			`INSERT INTO links (url, "shortUrl") VALUES ($1, $2) RETURNING id, "shortUrl"`,
			[url, shortUrl]
		);
		const linkId = rows[0].id;
		await db.query(
			`INSERT INTO "userLinks" ("userId", "linkId") VALUES ($1, $2)`,
			[userId, linkId]
		);
		res.status(201).send(rows[0]);
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

async function getUrlById(req, res) {
	const { id } = req.params;
	try {
		const { rows } = await db.query(
			`SELECT id,"shortUrl",url FROM links WHERE id = $1`,
			[id]
		);
		if (rows.length === 0) {
			return res.status(404).send("Not Found");
		}
		res.status(200).send(rows[0]);
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

async function openUrl(req, res) {
	const { id, url } = res.locals.url;
	try {
		await db.query(
			`UPDATE links SET "visitCount" = "visitCount" + 1 WHERE id = $1`,
			[id]
		);
		res.redirect(url);
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

export { shortenUrl, getUrlById, openUrl };
