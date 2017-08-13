module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

period :: Planet -> Float
period Mercury = 0.2408467
period Venus   = 0.61519726
period Mars    = 1.8808158
period Earth   = 1
period Jupiter = 11.862615
period Saturn  = 29.44749
period Uranus  = 84.016846
period Neptune = 164.79132

ageOn :: Planet -> Float -> Float
ageOn planet seconds =
  seconds / (earthYear * (period planet))
  where
    earthYear = 24 * 60 * 60 * 365.25
