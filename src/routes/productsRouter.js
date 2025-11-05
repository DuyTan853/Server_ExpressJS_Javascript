import express from "express";
import Products_Controller from "../controllers/productsController.js";
const router = express.Router();

router.get("/all", Products_Controller.showAllProducts); // show all products
router.get("/:slug", Products_Controller.show); // show product by :slug
router.post("/", Products_Controller.create); // create new product

export default router;
