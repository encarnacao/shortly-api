import Joi from "joi";

export function validateRequest(schema) {
	return (req, res, next) => {
		const { error } = Joi.validate(
			req.body,
			Joi.object().keys(schema).unknown(false)
		);
		if (error) {
			return res.status(422).json({ error: error.details[0].message });
		}
		next();
	};
}
