import { postSchema } from "../schemas/schemas.js";
import { validateRequest } from "../middlewares/validateSchemas.js";
import { authorizeToken } from "../middlewares/authMiddlewares.js";
import { getUrlById, shortenUrl } from "../controllers/urlControllers.js";
import { Router } from "express";
const router = Router();

router.post(
	"/urls/shorten",
	validateRequest(postSchema),
	authorizeToken,
	shortenUrl
);

router.get("/urls/:id", getUrlById);

export default router;
