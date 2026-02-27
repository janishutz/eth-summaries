-- Declaring a function. Naming using lowerCamelCase
-- Arguments separated by whitespace
myFunc :: Int -> Int -> Int
myFunc x y
  | x > 0 = x + y
  | x < 0 = -x + y

-- On compile the above function is transformed like this:
-- TODO: Transform the template into correct version
myFuncXCompiled :: Int -> Int
myFuncXCompiled x = x
