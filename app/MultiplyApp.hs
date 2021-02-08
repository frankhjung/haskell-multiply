#!/usr/bin/env runhaskell

{-

Perform multiplication of 2 natural numbers using the
<https://en.wikipedia.org/wiki/Ancient_Egyptian_multiplication Egyptian multiplication>
algorithm.

>>> runhaskell multiplyApp.hs 12 15
180

-}

module Main (main) where

import           Multiply           (multiply3)
import           System.Environment (getArgs)

solve :: [Word] -> Word
solve []      = error "Usage multiplyApp a b"
solve (a:b:_) = multiply3 a b
solve [_]     = error "Usage multiplyApp a b"

-- | Run example, read values from STDIN.
--
-- >>> runhaskell multiply.hs 12 15
-- 180
main :: IO ()
main = getArgs >>= print . solve . map read
