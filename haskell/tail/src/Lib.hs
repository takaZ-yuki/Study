module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = do cs <- getContents
              putStr $ lastNLines 10 cs
              print $ reverse ["1","2","3","4","5","6","7","8","9"]
              print $ reverse [1,2,3,4,5,6,7,8,9]

lastNLines n cs = unlines $ takeLast n $ lines cs
takeLast n cs = reverse $ take n $ reverse cs