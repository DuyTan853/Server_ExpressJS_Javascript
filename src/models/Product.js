import mongoose from "mongoose";
import { Schema } from "mongoose";

const productSchema = new Schema({
  idProduct: { type: String, required: false },
  nameProduct: { type: String, required: false },
  shortDescription: { type: String, required: false },
  oldPrice: { type: Number, required: false },
  newPrice: { type: Number, required: false },
  categorize: { type: String, required: false },
  brand: { type: String, required: false },
  images: { type: [String], required: false },
  promotion: { type: Number, required: false },
  status: { type: String, required: false },
  filter: { type: String, required: false },
  rate: { type: Number, required: false },
  createAt: { type: Date, default: Date.now },
  updateAt: { type: Date, default: Date.now },
});

const Product = mongoose.model("Products", productSchema);

export default Product;
