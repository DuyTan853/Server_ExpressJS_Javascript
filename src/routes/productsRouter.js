import express from "express";
import ProductsController from "../controllers/ProductsController.js";
const router = express.Router();

router.post("/add", ProductsController.createProduct); // create new product
router.get("/", ProductsController.showAllProducts); // show all products
router.get("/:slug", ProductsController.showOneProductBySlug); // show product by :slug
router.put("/:idProduct", ProductsController.updateProduct);
router.delete("/:id", ProductsController.deleteProduct);
export default router;
