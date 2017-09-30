module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = do cs <- getContents
              print $ words cs
              print $ length $ words cs