import { v4 } from "uuid";
import { hash, compare } from "bcrypt";
import { db } from "../config/database.connect.js";

async function singUp(req, res) {
	const { name, email, password } = req.body;
	try {
		const hashedPassword = await hash(password, 10);
		const insert = await db.query(
			`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`,
			[name, email, hashedPassword]
		);
		if (insert.rowCount === 0) {
			return res.status(400).send("Bad Request");
		}
		res.status(201).send("Created");
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

export { singUp };
