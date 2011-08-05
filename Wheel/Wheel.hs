-- using only (:), ($)
-- Prelude will be reinvented.
-- Do not disrespect  (dis-ru) reinventing the wheel. it is important.
-- You will learn many essentials from it.
-- Akira Hayakawa, 2011

module Wheel (
  Wheel.flip,
  Wheel.foldr,
  Wheel.foldl,
  Wheel.concat,
  Wheel.map,
  Wheel.reverse,
  Wheel.takeWhile,
  Wheel.dropWhile,
  Wheel.length,
  Wheel.head,
  Wheel.tail
) where

const :: a -> b -> a
const x y = x

length :: [a] -> Int
length xs = Wheel.foldr (+) 0 $ Wheel.map (Wheel.const 1) xs

tail :: [a] -> [a]
tail [] = []
tail (x:xs) = xs

head :: [a] -> Maybe a
head [] = Nothing
head (x:xs) = Just x

flip :: (a->b->c) -> (b->a->c)
flip f x y = f y x 

foldr :: (a->b->b) -> b -> [a] -> b
foldr f init [] = init
-- This implementation below recurses eternally.
-- foldr f init (x:xs) = Wheel.foldr f (Wheel.foldr f init xs) [x]

-- This implementation works but reversing the list is quite overhead.
-- foldr f init xs = Wheel.foldl (Wheel.flip f) init $ reverse xs

-- This implementation is more intuitive.
foldr f init (x:xs) = f x $ Wheel.foldr f init xs

-- Maybe bad because the use of foldl function.
reverse :: [a] -> [a]
reverse xs = Wheel.foldl (Wheel.flip (:)) [] xs

foldl :: (a->b->a) -> a -> [b] -> a 
foldl f init [] = init
foldl f init (x:xs) = Wheel.foldl f (f init x) xs

-- Too slow. Too luxuriousa (++) function 
concat :: [[a]] -> [a]
concat = Wheel.foldl (++) [] 

map :: (a->b) -> [a] -> [b]
map f [] = []
map f (x:xs) = (f x) : Wheel.map f xs

takeWhile :: (a->Bool) -> [a] -> [a]
takeWhile f (x:xs) = 
  if f x then x:Wheel.takeWhile f xs else []

dropWhile :: (a->Bool) -> [a] -> [a]
dropWhile = undefined
