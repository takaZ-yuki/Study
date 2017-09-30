module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = do cs <- getContents
              print $ length $ lines cs
              putStrLn "SAMPLE" -- SAMPLE
              print "SAMPLE" -- "SAMPLE"
              print 20000000 -- 20000000
              print ["hoge", "piyo", "poyo"] -- ["hoge", "piyo", "poyo"]
              print $ length ["hoge", "piyo", "poyo"] -- 3
              print [10, 20, 30] -- [10, 20, 30]
              print $ length [10, 20, 30] -- 3
              print $ lines "test\nsample\nhoge" --["test", "sample", "hoge"]
