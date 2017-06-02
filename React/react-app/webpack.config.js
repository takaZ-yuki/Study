const path = require('path');
const webpack = require('webpack');

module.exports = {
  context: path.join(__dirname, 'src'),
  entry: {
    js: './index.js'
  },
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  },
  // webpack-dev-serverの設定
  devServer: {
    // キャッシュしない
    // cache: false,

    // コンテンツルート
    contentBase: 'dist',
    //ホットモードで起動 <- なんかエラー出てる・・・
    // hot: true,
    historyApiFallback: false,
    // iframeモードとinlineモードがある
    // iframeモード：アプリケーションがiframeを埋め込まれており、余計なヘッダがついてくる
    // inlineモード：更新でページ再読み込み
    inline: true,
    open: true,
    //出力に色つきにするか
    // colors: true,
    //dev-serverのポートの指定 default: 8080
    port: 8080
  },

  plugins: [
    // ミニファイ化 設定
    new webpack.optimize.UglifyJsPlugin()
  ],

  module: {
    loaders: [{
      test: /.js?$/,
      //todo: babel-loaderを調べる
      loader: 'babel-loader',
      exclude: /node_modules/,
      query: {
        presets: ['es2015', 'react']
      }
    }]
  },

  resolve: {
    extensions: ['.*', '.js', '.jsx', '.css']
  },
  devtool: 'source-map'
};