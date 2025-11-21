import {
  Product,
  Brand,
  Category,
  ProductSpec,
  ProductImage,
} from "../models/index.js"; // file /models/index.js là nơi thiết lập quan hệ(associations) sự phụ thuộc khóa chính khóa ngoại với sequelize

class ProductController {
  // [GET] show product by slug
  async showOneProductBySlug(req, res) {
    try {
      const { slug } = req.params;
      const product = await Product.findOne({
        where: { slug }, // truy vấn từ slug nhận vào
        attributes: {
          exclude: ["brandId", "categoryId", "tagId"], // BỎ NHỮNG CỘT KHÔNG MUỐN SHOW
        },
        include: [
          {
            model: Brand,
            as: "brand",
            attributes: ["nameBrand"], // show ra cột nameBrand
          },
          {
            model: Category,
            as: "category",
            attributes: ["nameCategory"],
          },
          {
            model: ProductSpec,
            as: "specs",
            attributes: [
              "id",
              "productId",
              "screenSize",
              "screenTechnology",
              "rearCamera",
              "frontCamera",
              "chipset",
              "internalMemory",
              "battery",
              "operatingSystem",
              "screenResolution",
              "screenFeatures",
              "cpuType",
              "compatibility",
              "quantity",
            ],
          },
          {
            model: ProductImage,
            as: "images",
            attributes: ["imageUrl"],
          },
        ],
      });

      if (!product) {
        return res.status(404).json({ message: "Product not found" });
      }

      res.status(200).json({ product });
    } catch (error) {
      console.error("Error fetching product:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  // [GET] show all products
  async showAllProducts(req, res) {
    try {
      const products = await Product.findAll({
        // attributes: {
        //   exclude: ["brandId", "categoryId", "tagId"], // BỎ NHỮNG CỘT KHÔNG MUỐN SHOW
        // },
        include: [
          {
            model: Brand,
            as: "brand",
            attributes: ["nameBrand"], // show ra cột nameBrand
          },
          {
            model: Category,
            as: "category",
            attributes: ["nameCategory"],
          },
          {
            model: ProductSpec,
            as: "specs",
            attributes: [
              "id",
              "productId",
              "screenSize",
              "screenTechnology",
              "rearCamera",
              "frontCamera",
              "chipset",
              "internalMemory",
              "battery",
              "operatingSystem",
              "screenResolution",
              "screenFeatures",
              "cpuType",
              "compatibility",
              "quantity",
            ],
          },
          {
            model: ProductImage,
            as: "images",
            attributes: ["imageUrl"],
          },
        ],
      });
      res.status(200).json({ products });
    } catch (error) {
      console.error("Error fetching all products:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  // [POST] create new product
  async createProduct(req, res) {
    try {
      const {
        idProduct,
        nameProduct,
        slug,
        categoryId,
        brandId,
        tagId,
        price,
        originalPrice,
        discountPercent,
        thumbnail,
        shortDesc,
        description,
        isFeatured,
        status,
        allowInstallment,
        allowOnlinePrice,
        images,
        specs,
      } = req.body;

      // Kiểm tra các trường bắt buộc
      if (!nameProduct || !slug || !categoryId || !brandId || !price) {
        return res.status(400).json({ message: "Missing required fields" });
      }

      const product = await Product.create(
        {
          idProduct: "PROD-" + idProduct,
          nameProduct: nameProduct.trim().replace(/\s+/g, " "), // xóa khoảng trắng dư
          slug,
          categoryId,
          brandId,
          tagId: tagId || null,
          price,
          originalPrice,
          discountPercent: discountPercent || 0,
          thumbnail: thumbnail || null,
          shortDesc: shortDesc || null,
          description: description || null,
          isFeatured: isFeatured ? 1 : 0,
          status: status || "active",
          allowInstallment: allowInstallment ? 1 : 0,
          allowOnlinePrice: allowOnlinePrice ? 1 : 0,
          createdAt: new Date(),
          updatedAt: new Date(),

          // Nested creation
          images: images?.map((img) => ({ imageUrl: img.imageUrl })) || [],
          specs:
            specs?.map((s) => ({
              screenSize: s.screenSize || null,
              screenTechnology: s.screenTechnology || null,
              rearCamera: s.rearCamera || null,
              frontCamera: s.frontCamera || null,
              chipset: s.chipset || null,
              internalMemory: s.internalMemory || null,
              battery: s.battery || null,
              operatingSystem: s.operatingSystem || null,
              screenResolution: s.screenResolution || null,
              screenFeatures: s.screenFeatures || null,
              cpuType: s.cpuType || null,
              compatibility: s.compatibility || null,
              quantity: s.quantity || 0,
            })) || [],
        },
        {
          include: [
            { model: ProductImage, as: "images" },
            { model: ProductSpec, as: "specs" },
          ],
        }
      );

      res.status(201).json({ message: "Product created", product });
    } catch (error) {
      console.error("Error creating product:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  // [PUT] update product by slug
  async updateProduct(req, res) {
    try {
      const { idProduct } = req.params;
      const {
        nameProduct,
        slug,
        categoryId,
        brandId,
        tagId,
        price,
        originalPrice,
        discountPercent,
        thumbnail,
        shortDesc,
        description,
        isFeatured,
        status,
        allowInstallment,
        allowOnlinePrice,
        images,
        specs,
      } = req.body;

      // UPDATE bảng Product
      await Product.update(
        {
          nameProduct: nameProduct.trim(),
          slug,
          categoryId,
          brandId,
          tagId: tagId || null,
          price,
          originalPrice,
          discountPercent: discountPercent || 0,
          thumbnail: thumbnail || null,
          shortDesc: shortDesc || null,
          description: description || null,
          isFeatured: isFeatured ? 1 : 0,
          status: status || "active",
          allowInstallment: allowInstallment ? 1 : 0,
          allowOnlinePrice: allowOnlinePrice ? 1 : 0,
          updatedAt: new Date(),
        },
        { where: { idProduct } }
      );

      // UPDATE bảng ProductImage (xóa cũ, thêm mới)
      if (images && images.length > 0) {
        await ProductImage.destroy({ where: { productId: idProduct } });
        await ProductImage.bulkCreate(
          images.map((img) => ({
            productId: idProduct,
            imageUrl: img.imageUrl,
          }))
        );
      }

      // UPDATE bảng ProductSpec (xóa cũ, thêm mới)
      if (specs && specs.length > 0) {
        await ProductSpec.destroy({ where: { productId: idProduct } });
        await ProductSpec.bulkCreate(
          specs.map((s) => ({
            productId: idProduct,
            screenSize: s.screenSize || null,
            screenTechnology: s.screenTechnology || null,
            rearCamera: s.rearCamera || null,
            frontCamera: s.frontCamera || null,
            chipset: s.chipset || null,
            internalMemory: s.internalMemory || null,
            battery: s.battery || null,
            operatingSystem: s.operatingSystem || null,
            screenResolution: s.screenResolution || null,
            screenFeatures: s.screenFeatures || null,
            cpuType: s.cpuType || null,
            compatibility: s.compatibility || null,
            quantity: s.quantity || 0,
          }))
        );
      }

      res.json({ message: "Cập nhật sản phẩm thành công" });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Lỗi server", error: error.message });
    }
  }

  // [DELETE] delete product by id
  async deleteProduct(req, res) {
    try {
      const { id } = req.params;
      const deleted = await Product.destroy({
        where: { idProduct: id },
      });

      if (deleted) {
        return res.status(200).json({ message: "Đã xóa thành công" });
      }
      return res.status(404).json({ message: "Không tìm thấy product" });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Lỗi server" });
    }
  }
}

export default new ProductController();
