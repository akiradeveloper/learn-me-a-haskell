newtype While a = While { get :: (a, Bool) }

instance Functor While where
  fmap f (While (a, True)) = let (a', b) = f a in While (a', b)
  fmap _ (While (a, False)) = While (a, False)

countDown :: Int -> (Int, Bool)
countDown i =
  let i' = i - 1
  in 
    if i' < 0 then (i, False) else (i', True)

main = do
  let result = get $ While (1, True) `fmap` countDown `fmap` countDown 
  print result
