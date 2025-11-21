import productsRouter from "./productsRouter.js";
import brandRouter from "./brandRouter.js";
import categoryRouter from "./categoryRouter.js";
import specRouter from "./specRouter.js";

function routes(app) {
  app.use("/products", productsRouter);
  app.use("/brands", brandRouter);
  app.use("/categories", categoryRouter);
  app.use("/specs", specRouter);
}
export default routes;
