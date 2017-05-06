// webpack.config.js
var path = require('path');
var webpack = require('webpack');

module.exports = {
    context: path.join(__dirname, 'src'),
    entry: {
        js: './action.js',
    },
    output: {
        path: path.join(__dirname, 'build'),
        filename: 'bundle.min.js'
    },

    plugins: [
        // ミニファイ化 設定
        new webpack.optimize.UglifyJsPlugin()
    ],

    // ソースマップ作成
    devtool: 'source-map',
    module: {
        loaders: [{
                test: /.jsx?$/,
                //todo: babel-loaderを調べる
                loader: 'babel-loader',
                exclude: /node_modules/,
                query: {
                    presets: ['es2015']
                }
            },
            {
                // htmlファイルの読み込み
                test: /\.html?$/,
                exclude: /node_modules/,
                // 出力先のpathは、outputのpathを見てるっぽい
                loader: 'file?name=[path][name].[ext]'
            }
        ]
    }
}