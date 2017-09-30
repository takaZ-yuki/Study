module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = do cs <- getContents
              print cs
              print $ length "a\nb"
              print $ length cs
