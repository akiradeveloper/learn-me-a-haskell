-- Single value must be Monad.
-- Akira Hayakawa, 2011

import Control.Applicative
import Control.Monad

data Single a = Single a deriving (Eq, Show, Ord)

instance Functor Single where
--  fmap :: (a->b) -> Single a -> Single b
-- Error : "parse error in pattern" WHY???
--  fmap f $ Single x = Single (f x)
  fmap f (Single x) = Single (f x)

instance Applicative Single where
--  pure :: a -> Single a
  pure x = Single x
--  (<*>) :: Single (a->b) -> Single a -> Single b
  Single f <*> Single x = Single (f x) 

instance Monad Single where
--  return :: a -> Single a
  return = pure
--  (>>=) :: Single a -> (a->Single b) -> Single b
  Single a >>= f = f a 
  
main = do
  -- For Functor
  print $ fmap (\x -> 3*x) (Single 10)

  -- For Applicative
  print $ (\x -> 30*x) <$> Single 10
  print $ Single (\x -> 300*x) <*> Single 10

  -- For Monad
  print $ Single 10 >>= \x -> Single (3000*x)
