import { db } from "../config/database.connect.js";
import { compare } from "bcrypt";

async function singUpConflict(req, res, next) {
	const { email } = req.body;
	try {
		const user = await db.query(`SELECT * FROM users WHERE email = $1`, [
			email,
		]);
		if (user.rowCount > 0) {
			return res.status(409).send("Conflict");
		}
		next();
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

async function authorizeLogin(req, res, next) {
	const { email, password } = req.body;
	try {
		const user = await db.query(`SELECT * FROM users WHERE email = $1`, [
			email,
		]);
		if (user.rowCount === 0) {
			return res.status(401).send("Unauthorized");
		}
		const passwordCheck = await compare(password, user.rows[0].password);
		if (!passwordCheck) {
			return res.status(401).send("Unauthorized");
		}
		res.locals.user = user.rows[0];
		next();
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

async function finishSession(_, res, next) {
	const { id } = res.locals.user;
	try {
		await db.query(`DELETE FROM sessions WHERE "userId" = $1`, [id]);
		next();
	} catch (e) {
		console.log(e);
		res.status(500).send("Internal Server Error");
	}
}

export { singUpConflict, authorizeLogin, finishSession };
