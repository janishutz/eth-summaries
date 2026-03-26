{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use lambda-case" #-}
{-# HLINT ignore "Use newtype instead of data" #-}

import Prelude hiding (return, (>>), (>>=))

data Parser a = Prs (String -> [(a, String)])

-- Main parser function
parse :: Parser a -> String -> [(a, String)]
parse (Prs p) = p

-------------------
-- Basic parsers --
-------------------
-- Trivial failure ([] signifies parse failed)
failure :: Parser a
failure = Prs (const [])

-- Trivial success without progress
return :: a -> Parser a
return x = Prs (\inp -> [(x, inp)])

-- Trivial success with progress
item :: Parser Char
item =
  Prs
    ( \inp -> case inp of
        "" -> []
        (x : xs) -> [(x, xs)]
    )

----------
-- Glue --
----------
-- Apply both parsers
(|||) :: Parser a -> Parser a -> Parser a
p ||| q = Prs (\s -> parse p s ++ parse q s)

-- If first parser fails, apply second parser
(+++) :: Parser a -> Parser a -> Parser a
p +++ q =
  Prs
    ( \s -> case parse p s of
        [] -> parse q s
        res -> res
    )

-- Sequencing (first parser p, then parser q)
(>>=) :: Parser a -> (a -> Parser b) -> Parser b
p >>= g = Prs (\s -> [(u, s'') | (t, s') <- parse p s, (u, s'') <- parse (g t) s'])

-- Simple version of the above
(>>) :: Parser a -> Parser b -> Parser b
p >> q = p >>= const q

-- Parse single character with property p
sat :: (Char -> Bool) -> Parser Char
sat p = item >>= \x -> if p x then return x else failure

char :: Char -> Parser Char
char x = sat (== x)

string :: String -> Parser String
string "" = return ""
string (x : xs) = char x >> string xs >> return (x : xs)

-- 0 or more repetitions of p
many :: Parser a -> Parser [a]
many p = many1 p ||| return []

-- 1 or more repetitions of p
many1 :: Parser a -> Parser [a]
many1 p = p >>= \t -> many p >>= \ts -> return (t : ts)
