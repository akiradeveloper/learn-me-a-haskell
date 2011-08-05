module Main where
import WheelCheck
import Test.QuickCheck

main = do
  quickCheck WheelCheck.prop_reverse
