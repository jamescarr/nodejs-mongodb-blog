mongoose = require 'mongoose'

Post = new mongoose.Schema(
  title: String
  body: String
)

module.exports = mongoose.model 'Post', Post
