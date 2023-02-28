import { db } from "../config/database.connect.js";

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

export { singUpConflict };
