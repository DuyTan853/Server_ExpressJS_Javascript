import mysql from "mysql2/promise";
import dotenv from "dotenv";
dotenv.config();

const connectDatabase = async () => {
  const connecttion = await mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
  });

  connecttion.connect((err) => {
    if (err) {
      console.error("Error connecting to the database:", err);
      return;
    }
    console.log("Connected to the MySQL database.");
  });
  return connecttion;
};
export default connectDatabase;
