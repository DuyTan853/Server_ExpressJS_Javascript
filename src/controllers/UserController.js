import { User } from "../models/index.js";
class UserController {
  async showUserById(req, res) {
    try {
      const { idUser } = req.params;
      const user = await User.findOne({
        where: { idUser },
      });

      return res.status(200).json({ user: user });
    } catch (error) {
      console.log("Error fetching Sser: ", error);
      return res
        .status(500)
        .json({ message: "server error", error: error.message });
    }
  }

  async showAllUsersByLimit(req, res) {
    const page = parseInt(req.query.page) || 1; // trang hiện tại
    const limit = parseInt(req.query.limit) || 10; // số bản ghi trên 1 trang
    const offset = (page - 1) * limit; // bỏ qua bao nhiêu bản ghi

    try {
      const { count, rows } = await User.findAndCountAll({
        offset: offset,
        limit: limit,
      });
      return res.status(200).json({
        users: rows,
        totalItems: count,
        totalPages: Math.ceil(count / limit),
        currentPage: page,
      });
    } catch (error) {
      console.log("Error fetching Sser: ", error);
      return res
        .status(500)
        .json({ message: "server error", error: error.message });
    }
  }

  async showAllUsers(req, res) {
    try {
      const users = await User.findAll({});
      return res.status(200).json({ users: users });
    } catch (error) {
      console.log("Error fetching Sser: ", error);
      return res
        .status(500)
        .json({ message: "server error", error: error.message });
    }
  }

  async createUser(req, res) {
    try {
      // lấy từ formdata với trường là FinallUser
      const data = JSON.parse(req.body.FinalUser);

      // lấy avatar phải giống multer upload ở Router
      const avatarFile = req.file ? req.file.filename : null;
      console.log(">>>>>", avatarFile);

      const user = await User.create({
        idUser: "User-" + data.idUser,
        fullName: data.fullName,
        email: data.email,
        userName: data.userName,
        password: data.password,
        phone: data.phone,
        role: data.role,
        permissions: data.permissions,
        avatar: avatarFile || data.avatar,
        addresses: data.addresses,
        isVerified: data.isVerified || 1,
        createdAt: new Date(),
        updatedAt: new Date(),
      });

      return res.status(201).json({ message: "User created", user });
    } catch (error) {
      console.log("Error create User", error);
      res.status(500).json({ message: "error server", error: error.message });
    }
  }

  async updateUser(req, res) {}

  async deleteUser(req, res) {
    try {
      const { idUser } = req.params;
      await User.destroy({ where: { idUser } });
      return res.status(200).json({ message: " Đã xóa thành công" });
    } catch (error) {
      console.log("Error delete User", error);
      res.status(500).json({ message: "error server", error: error.message });
    }
  }
}
export default new UserController();
