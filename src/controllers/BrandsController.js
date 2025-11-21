import { Brand } from "../models/index.js";

class BrandsController {
  // [GET] show all brands
  async showAllBrands(req, res) {
    try {
      const brands = await Brand.findAll();
      res.status(200).json({ brands });
    } catch (error) {
      console.error("Error fetching all brands:", error);
      res.status(500).json({ message: "Server Error", error: error.message });
    }
  }

  // [POST] add brands
  async addBrand(req, res) {
    try {
      const { nameBrand, logo, isActive } = req.body;
      const brand = await Brand.create({
        nameBrand: nameBrand,
        logo: logo,
        isActive: isActive || 1,
      });
      res.status(201).json({ message: "Add brand complete", brand });
    } catch (error) {
      console.error("Error creating product:", error);
      res.status(500), json({ error: error.message });
    }
  }
  //[UPDATE] update brand
  async updateBrand(req, res) {
    try {
      const { id } = req.params; // Lấy id từ URL
      const { nameBrand, logo, isActive } = req.body;

      await Brand.update(
        { nameBrand: nameBrand, logo: logo, isActive: isActive }, // set brand mới
        { where: { idBrand: id } } // tìm brand cũ
      );

      res.json({ message: "Cập nhật brandId thành công" });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Lỗi server" });
    }
  }

  // [DELETE] delete brand by id
  async deleteBrand(req, res) {
    try {
      const { id } = req.params;
      const deleted = await Brand.destroy({
        where: { idBrand: id },
      });

      if (deleted) {
        return res.status(200).json({ message: "Đã xóa thành công" });
      }
      return res.status(404).json({ message: "Không tìm thấy brand" });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Lỗi server" });
    }
  }
}
export default new BrandsController();
