import { Router } from "express";
import { getMyUser } from "../controllers/userControllers.js";
import { authorizeToken } from "../middlewares/authMiddlewares.js";

const router = Router();

router.get("/users/me", authorizeToken, getMyUser);

export default router;
