import Data.Monoid
newtype CharList = CharList { getCharList :: [Char] }
  deriving (Monoid, Show)

main = do
  print $ CharList "akira"
  -- Unable to compile. How can I do this without defining CharList ++ CharList ?
  -- print $ CharList "akira" ++ CharList "developer"
 
  -- @thimura told me it is impossible. he said try GeneralizedNewtypeDeriving.
  -- Then I got an idea to make it monoid to use mappend function instead of (++) function.
  print $ CharList "akira" `mappend` CharList "developer"
