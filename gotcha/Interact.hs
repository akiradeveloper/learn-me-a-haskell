import qualified Data.List as L

main = interact myfunc

myfunc :: String -> String
myfunc = unlines . f . lines 
 where
  f = filter (\line -> "hoge" `L.isInfixOf` line) 
