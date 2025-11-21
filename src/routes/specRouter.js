import express from "express";
import SpecController from "../controllers/SpecController.js";
const router = express.Router();

router.get("/", SpecController.showAllSpecs);
router.post("/add", SpecController.addSpec);
router.patch("/:id", SpecController.updateSpecField);

export default router;
