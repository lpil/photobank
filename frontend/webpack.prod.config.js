const webpack = require("webpack");
const path = require("path");
const merge = require("webpack-merge");
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const CompressionPlugin = require("compression-webpack-plugin");
const config = require("./webpack.config");

module.exports = merge(config, {
  entry: path.join(__dirname, "src/index.js"),

  module: {
    loaders: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: "elm-webpack-loader",
        query: {
          pathToMake: "node_modules/.bin/elm-make"
        }
      },
      {
        test: /Stylesheets\.elm$/,
        use: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: [{ loader: "css-loader" }, { loader: "elm-css-webpack-loader" }]
        })
      }
    ]
  },

  plugins: [
    new webpack.optimize.UglifyJsPlugin({
      minimize: true,
      compressor: { warnings: false }
    }),

    new CompressionPlugin({
      algorithm: "gzip",
      test: /\.(js|html|css)$/
    }),

    new ExtractTextPlugin({
      filename: "[contenthash].css"
    })
  ]
});
