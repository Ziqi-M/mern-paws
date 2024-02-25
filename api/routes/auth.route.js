import express from "express";
import { signup } from "../controllers/auth.controller.js";
import { signin } from "../controllers/auth.controller.js";
import route from "color-convert/route.js";
const router = express.Router();

router.post("/signup", signup);
router.post("/signin", signin);

export default router;