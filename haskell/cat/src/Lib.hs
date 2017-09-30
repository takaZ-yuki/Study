module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = do cs <- getContents
              putStr cs
