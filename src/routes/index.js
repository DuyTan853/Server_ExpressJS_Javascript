import productsRouter from "./productsRouter.js";
import brandRouter from "./brandRouter.js";
import categoryRouter from "./categoryRouter.js";
import specRouter from "./specRouter.js";
import bannerRouter from "./bannerRouter.js";
import userRouter from "./userRouter copy.js";

// RESTful API
function routes(app) {
  app.use("/products", productsRouter);
  app.use("/brands", brandRouter);
  app.use("/categories", categoryRouter);
  app.use("/specs", specRouter);
  app.use("/banners", bannerRouter);
  app.use("/users", userRouter);
}
export default routes;
