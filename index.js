const express = require("express");
const mongoose = require("mongoose");
const {
  MONGO_USER,
  MONGO_PASS,
  MONGO_IP,
  MONGO_PORT,
} = require("./config/config");
const postRouter = require("./routes/postRoutes");
const userRouter = require("./routes/userRoutes");

const app = express();
const mongourl = `mongodb://${MONGO_USER}:${MONGO_PASS}@${MONGO_IP}:${MONGO_PORT}/?authSource=admin`;

const connectWithRetry = () => {
  mongoose
    .connect(mongourl, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      useFindAndModify: false,
    })
    .then(() => console.log("Successfully connected to DB"))
    .catch((e) => {
      console.log(e);
      setTimeout(connectWithRetry, 5000);
    });
};
connectWithRetry();
app.use(express.json());

app.get("/", (req, res) => {
  res.send("<h2>Hiii</h2>");
});
app.use("/api/v1/posts", postRouter);
app.use("/api/v1/users", userRouter);


const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`listening on port ${port}`));
