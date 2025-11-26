class UserController {
  async showUserById(req, res) {}

  async showAllUsers(req, res) {
    return res.status(200).json({ duytan: "duytan" });
  }

  async createUser(req, res) {}

  async updateUser(req, res) {}

  async deleteUser(req, res) {}
}
export default new UserController();
