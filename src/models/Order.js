import { DataTypes } from "sequelize";
import sequelize from "../databases/conectDatabase.js";

const Order = sequelize.define(
  "Order",
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

    idOrder: {
      type: DataTypes.STRING,
      allowNull: true,
    },

    subTotal: {
      type: DataTypes.DECIMAL(14, 2),
      allowNull: true,
    },

    discount: {
      type: DataTypes.DECIMAL(14, 2),
      allowNull: true,
    },

    shippingFree: {
      type: DataTypes.DECIMAL(14, 2),
      allowNull: true,
    },

    total: {
      type: DataTypes.DECIMAL(14, 2),
      allowNull: true,
    },

    paymentMethod: {
      type: DataTypes.STRING,
      allowNull: true,
    },

    paymentStatus: {
      type: DataTypes.STRING,
      allowNull: true,
    },

    status: {
      type: DataTypes.STRING,
      allowNull: true,
    },

    voucherCode: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    isConfirm: {
      type: DataTypes.TINYINT,
      defaultValue: 0,
    },
    recipient: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    address: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    note: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
  },
  {
    tableName: "orders",
    timestamps: true,
  }
);
export default Order;
