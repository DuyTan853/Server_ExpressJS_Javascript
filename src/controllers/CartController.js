import { where } from "sequelize";
import { Cart } from "../models/index.js";

class CartController {
  // [GET] show all Cart
  async showAllCarts(req, res) {
    try {
      const cart = await Cart.findAll({ where: { userId: req.user.userId } });
      res.status(200).json({ cart });
    } catch (error) {
      console.error("Error fetching all Cart:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  // [POST] add Cart
  async addCart(req, res) {
    try {
      const { userId, productId, quantity, totalPrice } = req.body;
      // nếu đã tồn tại thì tìm và update
      const existedCart = await Cart.findOne({ where: { userId, productId } });
      if (existedCart) {
        const cart = await existedCart.update({
          quantity: Number(existedCart.quantity) + Number(quantity),
          totalPrice: Number(existedCart.totalPrice) + Number(totalPrice),
        });
        return res.status(201).json({ message: "Add cart complete", cart });
      } else {
        const cart = await Cart.create({
          userId,
          productId,
          quantity: Number(quantity),
          totalPrice,
        });
        return res.status(201).json({ message: "Add cart complete", cart });
      }
    } catch (error) {
      console.error("Error creating status:", error);
      return res.status(500).json({ error: error.message });
    }
  }

  //[UPDATE] update status
  async updateCart(req, res) {
    try {
      const { userId, productId, quantity, totalPrice } = req.body;
      // Cập nhật : tìm ra productId và cộng số lượng trong data với số gửi đc gửi vào
      const existedCart = await Cart.findOne({ where: { productId } });
      const updated = await existedCart.update({
        userId,
        productId,
        quantity: Number(existedCart.quantity) + Number(quantity),
        totalPrice: Number(existedCart.totalPrice) + Number(totalPrice),
      });

      if (updated) {
        return res.json({ message: "Cập nhật status thành công" });
      } else {
        return res.status(404).json({ message: "Không tìm thấy status này" });
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Lỗi server" });
    }
  }

  // [DELETE] delete category by id
  async deleteCart(req, res) {
    try {
      const { id } = req.params;
      const deleted = await Cart.destroy({ where: { id } });

      if (deleted) {
        return res.status(200).json({ message: "Đã xóa thành công" });
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Lỗi server" });
    }
  }
}

export default new CartController();
