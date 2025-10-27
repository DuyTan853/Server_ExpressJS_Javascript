import productsModel from "../models/Product.js";

class getAllProducts {
  // [GET] show product by :slug
  async show(req, res) {
    try {
      const { slug } = req.params;
      const product = await productsModel.find({ idProduct: slug });
      res.status(200).json({ product });
    } catch (error) {
      console.error("Error fetching product:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  // [GET] show all products
  async showAllProducts(req, res) {
    try {
      const products = await productsModel.find({});
      res.status(200).json({ products });
    } catch (error) {
      console.error("Error fetching all products:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  //[POST] create new product
  async create(req, res) {
    try {
      const newProduct = new productsModel(req.body);
      const savedProduct = await newProduct.save();
      res
        .status(201)
        .json({ message: "Product created", product: savedProduct });
    } catch (error) {
      console.error("Error creating product:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  //[PUT] update product by :lsug
}
export default new getAllProducts();
