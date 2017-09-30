module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = do cs <- getContents
              putStr $ firstNLines 10 cs
              print $ unlines ["test", "sample", "hoge"] -- "test\nsample\nhoge\n"
              print $ take 10 ["test", "sample", "hoge1", "hoge2", "hoge3", "hoge4", "hoge5", "hoge6", "hoge7", "hoge8", "hoge9", "hoge10", "hoge11", "hoge12", "hoge13"] -- ["test", "sample", "hoge1", "hoge2", "hoge3", "hoge4", "hoge5", "hoge6", "hoge7", "hoge8"]
              print $ take 2 ["test", "sample", "hoge1", "hoge2", "hoge3", "hoge4", "hoge5", "hoge6", "hoge7", "hoge8", "hoge9", "hoge10", "hoge11", "hoge12", "hoge13"] -- ["test", "sample"]

firstNLines n cs = unlines $ take n $ lines cs
