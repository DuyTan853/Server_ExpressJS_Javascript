import mongoose from "mongoose";
import { Schema } from "mongoose";

const productSchema = new Schema({
  idProduct: { type: String, unique: true, required: true },
  nameProduct: { type: String, required: true },
  slug: { type: String, required: true },
  categoryId: { type: String, unique: true, required: true },
  brandId: { type: String, unique: true, required: true },
  price: { type: Number, required: true },
  originalPrice: { type: Number, required: true },
  discountPercent: { type: Number, required: true },
  thumbnail: { type: String, required: true },
  images: [
    {
      image: { type: String, required: true },
      alt: { type: String, required: false },
    },
  ],
  shortDescription: { type: String, required: true },
  decription: { type: String, required: true },
  specs: {
    screen: { type: String, required: false },
    chipset: { type: String, required: false },
    ram: { type: String, required: false },
    storage: { type: String, required: false },
    battery: { type: String, required: false },
    os: { type: String, required: false },
    cameray: { type: String, required: false },
  },
  tags: [{ type: String, required: false }],
  allowinstallment: { type: Boolean, default: true },
  allowOnlinePrice: { type: Boolean, default: true },
  quantity: { type: Number, required: true },
  createAt: { type: Date, default: Date.now },
  updateAt: { type: Date, default: Date.now },
});

const Product = mongoose.model("products", productSchema);

export default Product;
