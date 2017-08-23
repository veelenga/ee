module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA = mapM dna
  where
    dna 'C' = Just 'G'
    dna 'G' = Just 'C'
    dna 'T' = Just 'A'
    dna 'A' = Just 'U'
    dna  _  = Nothing
