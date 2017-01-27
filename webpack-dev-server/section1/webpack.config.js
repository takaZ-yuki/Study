const webpack = require('webpack');
var path = require('path');

module.exports = {
    context: path.join(__dirname, 'src'),
    entry: {
        javascript: './app.js',
    },

    output: { path: path.join(__dirname, 'dist'), filename: 'bundle.js' },

    // Configuration for dev server
    devServer: {
        contentBase: 'dist',
        port: 3000
    },

    module: {
        loaders: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loader: 'babel-loader',
                query: {
                    presets:['es2015']
                }
            }
        ]
    }
}