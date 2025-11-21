import express from "express";
import CategoriesController from "../controllers/CategoriesController.js";

const router = express.Router();

router.get("/", CategoriesController.showALLCategories); // show all products
router.post("/add", CategoriesController.addCategory);
router.put("/:id", CategoriesController.updateCategory);
router.delete("/:id", CategoriesController.deleteCategory);

export default router;
