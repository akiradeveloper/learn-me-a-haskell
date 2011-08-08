newtype CharList = CharList { getCharList :: [Char] }
  deriving (Show)

main = do
  print $ CharList "akira"
  -- Unable to compile. How can I do this without defining CharList ++ CharList ?
  -- print $ CharList "akira" ++ CharList "developer"
