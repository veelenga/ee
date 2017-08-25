module Acronym (abbreviate) where

import Data.Char (isLetter, isLower, isUpper, toUpper)

abbreviate :: String -> String
abbreviate text = reverse $ abbr text "" ' '
  where
    abbr "" acc _  = acc
    abbr (c:rest) acc p
      | (not . isLetter) p && isLetter c = abbr rest (toUpper c : acc) c
      | isLower p && isUpper c = abbr rest (c : acc) c
      | otherwise = abbr rest acc c
