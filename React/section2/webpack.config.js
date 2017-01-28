// webpack.config.js
var path = require('path');
var webpack = require('webpack');

module.exports = {
  context: path.join(__dirname, 'src'),
  entry: {
    jsx: './main.jsx',
    html: './index.html'
  },
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js'
  },

  devServer: {
    progress: true,
    colors: true,
    hot: true,
    inline: true
  },

  module: {
    loaders: [{
        test: /.jsx?$/,
        //todo: babel-loaderを調べる
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
          presets: ['es2015', 'react']
        }
      },
      {
        // htmlファイルの読み込み
        test: /\.html?$/,
        loader: 'file?name=[path][name].[ext]'
      }
    ]
  }
}