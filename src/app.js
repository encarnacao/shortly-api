import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import authRouter from "./routers/authRouter.js";
import urlRouter from "./routers/urlRouter.js";
import userRouter from "./routers/userRouter.js";

dotenv.config();

const app = express();
app.use(express.json());
app.use(cors());
app.use(authRouter);
app.use(urlRouter);
app.use(userRouter);

app.get("/", (_, res) => {
	res.send("Hello World!, your server is running, database url: " + process.env.DATABASE_URL);
});

app.listen(process.env.PORT, () => {
	console.log(`Server is running on port ${process.env.PORT}`);
});
