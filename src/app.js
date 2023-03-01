import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import authRouter from "./routers/authRouter.js";
import urlRouter from "./routers/urlRouter.js";
import userRouter from "./routers/userRouter.js";
import rankingRouter from "./routers/rankingRouter.js";

dotenv.config();

const app = express();
app.use(express.json());
app.use(cors());
app.use(authRouter);
app.use(urlRouter);
app.use(userRouter);
app.use(rankingRouter);

app.get("/", (_, res) => {
	res.send("Hello World!");
});

app.listen(process.env.PORT, () => {
	console.log(`Server is running on port ${process.env.PORT}`);
});
