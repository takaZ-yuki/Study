# Haskellはじめて見ました。

## Haskellとはいったい何？

Haskellとは、純粋関数型言語です。

## 関数型言語って何？

> 関数型プログラミングは  
> 複数の式を関数の適用によって組み合わせていくプログラミングスタイルである

[参考サイト](https://ja.wikipedia.org/wiki/%E9%96%A2%E6%95%B0%E5%9E%8B%E8%A8%80%E8%AA%9E)

## 純粋関数型言語って？

>書き換え可能な変数など副作用のある機能も一部合わせ持っている言語を  
>非純粋関数型言語と呼び、LISPやScheme、ML、OCaml、Scalaなど多くの言語がこれに含まれる。  
>これに対し、副作用を一切排除した言語は純粋関数型言語は呼ばれ、Haskellが特に有名である。

[参考サイト](http://e-words.jp/w/%E9%96%A2%E6%95%B0%E5%9E%8B%E8%A8%80%E8%AA%9E.html)

## 環境構築

Haskellは、スクリプト言語の様に気軽に実行する事ができます。  
Haskellは、コンパイル言語の様に実行形式（Windowsなら.exe）にコンパイルする事も可能

コンパイラ兼実行環境  
[GHC](https://www.Haskell.org/ghc/download_ghc_8_0_1#windows64)

インストールは、ダウンロードしてきたファイルを解凍し  
環境変数でbinのパスを追加する。

## Haskellを気軽に実行

ghci コマンドを使用する事で、Haskellのコマンドを受け付けるモードになります。

```
    C:\Users>ghci
   GHCi, version 8.0.1: http://www.haskell.org/ghc/  :? for help
   Prelude>
```

以下の様にコンソール上で実行することも可能です。

```
    Prelude> print "Hello World!"
    "Hello World!"
```

## Haskellのコンパイル方法

main.hs ファイルを作成し、以下の内容を記述してください。

```
    main = do
        print "Hello,World!"
```

そして、コマンドプロンプトで下記コマンドを実行

```
    C:\Users> ghc -o main main.hs
    [1 of 1] Compiling Main             ( main.hs, main.o )
    Linking main.exe ...
```

すると、main.exeが作成される。

