module Parser (
  parse 
) where

parseOnce :: (Maybe a, String) -> (Maybe a, String)
parseOnce (Just x, cs) =  
parseOnce (Nothing, cs) = (Nothing, cs)

tryParse :: String -> a

parseAll :: String -> a
parseAll cs = k

