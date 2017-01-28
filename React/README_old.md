# React環境構築


 まず作業用のフォルダを作成し、npmの初期化

```
  C:\User\yuki>mkdir react-app
  C:\User\yuki>cd react-app
  C:\User\yuki\react-app>npm init -y
```

今回は、webpackでビルドしようと思うので  
webpackとそれから開発用の簡易サーバとして  
webpack-dev-serverをinstallします。

```
  C:\User\yuki\react-app>npm install webpack webpack-dev-server --save-dev
```

コンパイル用に下記ツールをinstall(es2015も利用したい!!)  
- file-loader
- babel-loder
- babel-core
- babel-preset-es2015
- babel-preset-react

```
    C:\User\yuki\react-app>npm install file-loader babel-loader babel-core babel-preset-es2015 babel-preset-react --save-dev
```

react、react-domのinstall

```
  C:\User\yuki\react-app>npm install react react-dom --save
```

jsxファイルを配置するフォルダを作成

```
  C:\User\yuki\react-app>mkdir src
```

コンパイル後のファイルを配置するフォルダを作成

```
  C:\User\yuki\react-app>mkdir dist
```

main.jsxファイルを作成する。

```
// src/main.jsx
import React from 'react';
import ReactDOM from 'react-dom';

// コンポーネント名の頭文字は大文字にする
var HelloReact = React.createClass({
  render: function () {
    return (
      <h2>{this.props.children}</h2>
    );
  }
});

ReactDOM.render(
  <HelloReact>Sample</HelloReact>,
  document.querySelector("#app")
);
```

index.htmlを作成する。
```
<!-- src/index.html -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Hello React</title>
  </head>
  <body>
    <div id="app"></div>
    <script src="./bundle.js"></script>
  </body>
</html>
```

webpackの設定ファイルを作成する

```
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
        // 出力先のpathは、outputのpathを見てるっぽい
        loader: 'file?name=[path][name].[ext]'
      }
    ]
  }
}
```

package.jsonを修正する(reactなどのバージョンはnpmによって異なります。)

```
{
  "name": "react-app",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "start": "webpack-dev-server",
    "build": "webpack"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "react": "^15.4.2",
    "react-dom": "^15.4.2"
  },
  "devDependencies": {
    "babel-core": "^6.22.1",
    "babel-loader": "^6.2.10",
    "babel-preset-es2015": "^6.22.0",
    "babel-preset-react": "^6.22.0",
    "file-loader": "^0.9.0",
    "webpack": "^1.14.0",
    "webpack-dev-server": "^1.16.2"
  }
}
```

下記コマンドを実行すると、webpack-dev-serverが立ち上がります。  
http://localhost:8080/webpack-dev-server/  
に接続すると、Reactで作成したバーチャルDOMがバインドされて表示されます。

```
  C:\User\yuki\react-app>npm start
```

下記コマンドを実行すると下記ファイルがコンパイルされる。  
- dist/index.html
- dist/bundle.js

```
  C:\User\yuki\react-app>npm run build
```


