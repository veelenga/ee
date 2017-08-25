module DNA (nucleotideCounts) where

import Data.Map (Map, insertWith, fromList)

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts xs =
  let map = fromList [('A', 0), ('C', 0), ('G', 0), ('T', 0)]
  in calc map xs
  where
    calc map [] = Right map
    calc map (x:xs)
      | valid x = calc (insertWith (+) x 1 map) xs
      | otherwise = Left (x : " is invalid")
    valid 'A' = True
    valid 'C' = True
    valid 'G' = True
    valid 'T' = True
    valid  _  = False
