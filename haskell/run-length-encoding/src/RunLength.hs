module RunLength (decode, encode) where

import Data.List(group)
import Data.Char(isDigit)

decode :: String -> String
decode ""  = ""
decode [x] = [x]
decode text@(x : xs)
  | isDigit x =
    let (n, c:cs) = span isDigit text
    in replicate (read n) c ++ decode cs
  | otherwise = x : decode xs

encode :: String -> String
encode text = concatMap enc . group $ text
  where
    enc :: String -> String
    enc [x] = [x]
    enc  x  = (show . length) x ++ take 1 x
