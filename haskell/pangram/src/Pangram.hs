module Pangram (isPangram) where

import Data.Char (toLower, isAlpha)
import Data.List (group, sort, head)

isPangram :: String -> Bool
isPangram text = length uniqChars == 26
  where
    uniqChars = map head $ group . sort $ filter isAlpha $ map toLower text
