import { Router } from "express";
import { userSchema, loginSchema } from "../schemas/schemas.js";
import { validateRequest } from "../middlewares/validateSchemas.js";
import {
	authorizeLogin,
	finishSession,
	singUpConflict,
} from "../middlewares/authMiddlewares.js";
import { signIn, singUp } from "../controllers/authControllers.js";

const router = Router();
router.post(
	"/signin",
	validateRequest(loginSchema),
	authorizeLogin,
	finishSession,
	signIn
);

router.post("/signup", validateRequest(userSchema), singUpConflict, singUp);

export default router;
