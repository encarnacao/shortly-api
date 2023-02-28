import { Router } from "express";
import { userSchema, loginSchema } from "../schemas/schemas.js";
import { validateRequest } from "../middlewares/validateSchemas.js";
import { singUpConflict } from "../middlewares/checkConflicts.js";
import { singUp } from "../controllers/authControllers.js";

const router = Router();

router.post("/signup", validateRequest(userSchema), singUpConflict, singUp);

export default router;