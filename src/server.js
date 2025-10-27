import express from "express";
import dotenv from "dotenv";
import routes from "./routes/index.js";
import cors from "cors";
import connectDatabase from "./databases/conectDatabase.js";

const app = express();

// Load environment variables from .env file
dotenv.config();
const port = process.env.PORT || 3000;

// Enable CORS for all routes
app.use(cors());

//middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

await connectDatabase(); // Connect to the database before starting the server

routes(app); // Use the routes defined in src/routes/index.js

app.listen(port, () => {
  console.log(`>>>>>>>_http://localhost:${port}`);
});
