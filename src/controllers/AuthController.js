import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import { User } from "../models/index.js";
import { Op } from "sequelize";

class AuthController {
  async login(req, res) {
    const { phone, userName, password } = req.body;
    console.log(req.body);
    if (!password || (!userName && !phone)) {
      return res.status(400).json({ message: "Thiếu thông tin đăng nhập" });
    }

    // lấy field nhận đc userName hoặc phone
    const whereCondition = userName ? { userName } : { phone };
    const user = await User.findOne({ where: whereCondition });

    // xác thực pass hash
    const isMatch = await bcrypt.compare(password.trim(), user.password);
    if (!user || !isMatch) {
      return res.status(401).json({ message: "Sai userName hoặc mật khẩu" });
    }

    // tạo JWT
    const token = jwt.sign(
      { userId: user.idUser, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: "1d" }
    );

    res.json({
      token,
      user: {
        userId: user.idUser,
        name: user.userName,
        avatar: user.avatar,
        permissions: user.permissions,
      },
    });
  }
}

export default new AuthController();
