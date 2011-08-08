-- QuickChecks of the Wheel.
-- It is always important to check the product before it is delivered.
-- Akira Hayakawa

module WheelCheck where
import Wheel

prop_reverse xs = xs == (Wheel.reverse $ Wheel.reverse xs)
  where types = xs :: [Int]

-- module Main where
-- import WheelCheck
-- main = do
--   quichCheck WheelCheck.prop_reverse

-- Fail. Why?
prop_takedropWhile xs = xs == (Wheel.takeWhile pred xs ++ Wheel.dropWhile pred xs) 
  where
    types = xs :: [Int]
    pred = (<100) :: Int -> Bool
