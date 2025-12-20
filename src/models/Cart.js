import { DataTypes } from "sequelize";
import sequelize from "../databases/conectDatabase.js";

const Cart = sequelize.define(
  "Cart",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },

    userId: {
      type: DataTypes.STRING,
      allowNull: true,
    },

    productId: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },

    totalPrice: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    
    count: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  },
  {
    tableName: "carts",
    timestamps: true,
  }
);
export default Cart;
