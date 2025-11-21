import express from "express";
import BrandsController from "../controllers/BrandsController.js";

const router = express.Router();

router.get("/", BrandsController.showAllBrands); // show all products
router.post("/add", BrandsController.addBrand);
router.put("/:id", BrandsController.updateBrand);
router.delete("/:id", BrandsController.deleteBrand);

export default router;
