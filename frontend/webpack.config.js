const path = require("path");
const webpack = require("webpack");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const ManifestPlugin = require("webpack-manifest-plugin");

const merge = require("webpack-merge");

module.exports = {
  output: {
    path: path.resolve(__dirname, "dist/"),
    filename: "[hash].js"
  },

  module: {
    loaders: []
  },

  plugins: [
    new ManifestPlugin(),

    new HtmlWebpackPlugin({
      template: "src/index.html",
      inject: "body",
      filename: "index.html"
    })
  ]
};
