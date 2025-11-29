import productsRouter from "./productsRouter.js";
import brandRouter from "./brandRouter.js";
import categoryRouter from "./categoryRouter.js";
import specRouter from "./specRouter.js";
import bannerRouter from "./bannerRouter.js";
import stausRouter from "./statusRouter.js";
import userRouter from "./userRouter.js";
import roleRouter from "./roleRouter.js";
// RESTful API
function routes(app) {
  app.use("/products", productsRouter);
  app.use("/brands", brandRouter);
  app.use("/categories", categoryRouter);
  app.use("/specs", specRouter);
  app.use("/banners", bannerRouter);
  app.use("/status", stausRouter);
  app.use("/users", userRouter);
  app.use("/roles", roleRouter);
}
export default routes;
