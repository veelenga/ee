module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . nub $ scores
  where
    score limit factor multiplier acc
      | limit <= multiplier = acc
      | otherwise =
        score limit factor (multiplier + factor) (multiplier : acc)

    scores = foldl (\acc x -> score limit x x acc) [] factors
