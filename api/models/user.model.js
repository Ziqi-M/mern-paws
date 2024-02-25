import mongoose from "mongoose";

const userSchema = new mongoose.Schema(
  {
    username: {
      type: String,
      required: true,
      unique: true,
    },

    email: {
      type: String,
      required: true,
      unique: true,
    },

    password: {
      type: String,
      required: true,
    },
    profilePicture: {
      type: String,
      default: "https://static.vecteezy.com/system/resources/thumbnails/022/963/918/small/ai-generative-cute-cat-isolated-on-solid-background-photo.jpg",
    },
  },
  { timestamps: true }
);


const User = mongoose.model("User", userSchema);

export default User;