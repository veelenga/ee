module Bob (responseFor) where

import Data.Char (isSpace, toUpper, isAlpha)
import Data.List (isSuffixOf, dropWhileEnd)

responseFor :: String -> String
responseFor xs
  | shouting xs = "Whoa, chill out!"
  | question xs = "Sure."
  | silence  xs = "Fine. Be that way!"
  | otherwise   = "Whatever."

question :: String -> Bool
question xs = isSuffixOf "?" (dropWhileEnd isSpace xs)

silence :: String -> Bool
silence xs = (dropWhile isSpace xs) == ""

shouting :: String -> Bool
shouting xs = ((map toUpper xs) == xs) && (any isAlpha xs)
