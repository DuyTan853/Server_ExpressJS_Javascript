import connectDatabase from "../databases/conectDatabase.js";

// connect với database
const connection = await connectDatabase();
class getAllProducts {
  // [GET] show product by :slug
  async show(req, res) {
    try {
      const { slug } = req.params;
      // Truy vấn trực tiếp vào MySQL
      const [rows] = await connection.query(
        "SELECT * FROM products WHERE slug = ?",
        [slug]
      );
      // rows là mảng kết quả
      if (rows.length === 0) {
        return res.status(404).json({ message: "Product not found" });
      }
      res.status(200).json({ product: rows[0] });
    } catch (error) {
      console.error("Error fetching product:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  // [GET] show all products
  async showAllProducts(req, res) {
    try {
      const [products] = await connection.query("SELECT * FROM products");
      res.status(200).json({ products });
    } catch (error) {
      console.error("Error fetching all products:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  //[POST] create new product
  async create(req, res) {
    try {
      const { idProduct, nameProduct, slug, price } = req.body;
      await connection.execute(
        "INSERT INTO products (idProduct, nameProduct, slug, price) VALUES (?, ?, ?, ?)",
        [idProduct, nameProduct, slug, price]
      );
      res.status(201).json({ message: "Product created" });
    } catch (error) {
      console.error("Error creating product:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  //[PUT] update product by :lsug
}
export default new getAllProducts();
