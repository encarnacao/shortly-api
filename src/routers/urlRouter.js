import { postSchema } from "../schemas/schemas.js";
import { validateRequest } from "../middlewares/validateSchemas.js";
import { authorizeToken } from "../middlewares/authMiddlewares.js";
import {
	getUrlById,
	openUrl,
	shortenUrl,
} from "../controllers/urlControllers.js";
import { Router } from "express";
import { validateShortUrl } from "../middlewares/urlsMiddlewares.js";
const router = Router();

router.post(
	"/urls/shorten",
	validateRequest(postSchema),
	authorizeToken,
	shortenUrl
);

router.get("/urls/:id", getUrlById);

router.get("/urls/open/:shortUrl", validateShortUrl, openUrl);

export default router;
