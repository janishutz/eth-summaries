-- Declaring a function. Naming using lowerCamelCase. Arguments separated by whitespace
-- We can omit the parenthesis in the type (they show what compiler does)
-- The below function uses guards (boolean checks)
myFunc :: Int -> (Int -> Int)
myFunc x y
  | x > 0 = x + y
  | x < 0 = -x + y
  | otherwise = 0

-- If the checks are pattern-based, use pattern matching. _ is wildcard (any value)
-- It is used when we don't need the variable. You can combine pattern-matching and guards
myOtherFunc :: Int -> Int -> Int
myOtherFunc 0 _ = 0
myOtherFunc x 0 = x
myOtherFunc x y
  | x > 0 = x + y
  | x < 0 = -x + y
