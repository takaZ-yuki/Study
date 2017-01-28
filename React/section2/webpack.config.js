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

  // webpack-dev-serverの設定
  devServer: {
    // キャッシュしない
    cache: false,
    // コンテンツルート
    contentBase: 'dist', 
    //ホットモードで起動（それ意外あるの？）
    hot: true, 
    // iframeモードとinlineモードがある
    // iframeモード：アプリケーションがiframeを埋め込まれており、余計なヘッダがついてくる
    // inlineモード：更新でページ再読み込み
    inline: true, 
    //出力に色つきにするか
    colors: true, 
    //dev-serverのポートの指定 default: 8080
    port: 8080
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
        exclude: /node_modules/,
        loader: 'file-loader',
        // 出力先のpathは、outputのpathを見てるっぽい
        loader: 'file?name=[path][name].[ext]'
      }
    ]
  }
}