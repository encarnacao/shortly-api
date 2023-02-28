import Joi from "joi";

export const userSchema = Joi.object({
	name: Joi.string().min(3).max(50).required(),
	email: Joi.string().email().required(),
	password: Joi.string().min(6).max(15).required(),
	confirmPassword: Joi.any()
		.valid(Joi.ref("password"))
		.messages({ "any.only": "Passwords do not match" })
		.required(),
});

export const loginSchema = Joi.object({
	email: Joi.string().email().required(),
	password: Joi.string().min(6).max(15).required(),
});

export const postSchema = Joi.object({
	url: Joi.string().uri().required(),
});
