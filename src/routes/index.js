import productsRouter from "./productsRouter.js";

function routes(app) {
  app.use("/", productsRouter);
}
export default routes;
