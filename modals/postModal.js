const mongoose = require("mongoose");

const postSchema = new mongoose.Schema({
  title: {
    type: String,
    require: [true, "Post must have Title"],
  },
  body: {
    type: String,
    required: [true, "Post must have a Body"],
  },
});
const Post = mongoose.model("Post", postSchema);
module.exports = Post;
