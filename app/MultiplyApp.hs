#!/usr/bin/env runhaskell

{-

Perform multiplication of 2 natural numbers using the
<https://en.wikipedia.org/wiki/Ancient_Egyptian_multiplication Egyptian multiplication>
algorithm.

>>> stack exec multiplyApp 12 15
180

-}

module Main (main) where

import           System.Environment (getArgs)

import           Data.Version       (showVersion)
import           Multiply           (multiply4)
import           Paths_multiply     (version)

-- Read two numbers from command line to multiply together using
-- default algorithm.

-- TODO add option to select algorithm to run

-- read version from cabal configuration

usage :: [String]
usage = [
          "Usage: multiplyApp [int] [int]"
        , "This uses the Egyptian algorithm to multiply two positive integers."
        , "See https://en.wikipedia.org/wiki/Ancient_Egyptian_multiplication"
        , "Version: " ++ showVersion version
        ]

-- | Run example, read values from STDIN.
--
-- >>> stack exec multiplyApp 12 15
-- 180
main :: IO ()
main = do
    args <- getArgs
    case length args of
      2 ->  let [a, b] = map read args :: [Word]
            in print $ multiply4 a b
      _ ->  putStrLn $ unlines usage

