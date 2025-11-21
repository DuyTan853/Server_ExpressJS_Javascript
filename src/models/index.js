import Product from "./Product.js";
import Brand from "./Brand.js";
import Category from "./Category.js";
import ProductSpec from "./ProductSpec.js";
import ProductImage from "./ProductImage.js";

// Product → Brand
Product.belongsTo(Brand, {
  foreignKey: "brandId",
  targetKey: "idBrand",
  as: "brand",
});
Brand.hasMany(Product, {
  foreignKey: "brandId",
  sourceKey: "idBrand",
  as: "products",
});

// Product → Category
Product.belongsTo(Category, {
  foreignKey: "categoryId",
  targetKey: "idCate",
  as: "category",
});
Category.hasMany(Product, {
  foreignKey: "categoryId",
  sourceKey: "idCate",
  as: "products",
});

// Product -> ProductSpec
ProductSpec.belongsTo(Product, {
  foreignKey: "productId",
  as: "product",
});
Product.hasMany(ProductSpec, {
  foreignKey: "productId",
  as: "specs",
});

// Product -> ProductImage
ProductImage.belongsTo(Product, {
  foreignKey: "productId",
  as: "product",
});
Product.hasMany(ProductImage, {
  foreignKey: "productId",
  as: "images",
});

export { Product, Brand, Category, ProductSpec, ProductImage };
