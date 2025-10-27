import mongoose from "mongoose";

async function connectDatabase() {
  try {
    await mongoose.connect(process.env.MONGODB_URL, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log("Connected to MongoDB database successfully.");
  } catch (error) {
    console.error("Error connecting to MongoDB database:", error);
    process.exit(1); // Exit the process with failure
  }
}
export default connectDatabase;
