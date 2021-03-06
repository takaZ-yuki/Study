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
        path: path.join(__dirname, 'build'),
        filename: 'bundle.min.js'
    },

    plugins: [
        // ミニファイ化 設定
        new webpack.optimize.UglifyJsPlugin()
    ],

    devtool: 'soutce-map',

    module: {
        loaders: [{
                test: /\.js[x]?$/,
                //todo: babel-loaderを調べる
                loader: 'babel-loader',
                exclude: /node_modules/,
                query: {
                    presets: ['es2015', 'react']
                }
            },
            {
                test: /\.html?$/,
                exclude: /node_modules/,
                // 出力先のpathは、outputのpathを見てるっぽい
                loader: 'file?name=[path][name].[ext]'
            }
        ]
    }
}