module Grains (square, total) where

import Data.Maybe (fromJust)

square :: Integer -> Maybe Integer
square n
    | n > 0 && n < 65 = Just $ (iterate (* 2) 1) !! (fromInteger $ n - 1)
    | otherwise = Nothing

total :: Integer
total = sum $ fromJust $ mapM square [1..64]
