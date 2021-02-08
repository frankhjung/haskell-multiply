{-# LANGUAGE ScopedTypeVariables #-}

module MultiplySpec (spec) where

import           Multiply              (multiply0, multiply1, multiply2,
                                        multiply3, multiply4)

import           Test.Hspec            (Spec, describe)
import           Test.Hspec.QuickCheck (prop)
import           Test.QuickCheck       (Positive (..))

spec :: Spec
spec =
  describe"multiplication algorithms for positive integers" $ do
    prop "multiply0" $
      \(Positive (a :: Int), Positive (b :: Int)) -> multiply0 a b == a * b
    prop "multiply1" $
      \(Positive (a :: Int), Positive (b :: Int)) -> multiply1 a b == a * b
    prop "multiply2" $
      \(Positive (a :: Int), Positive (b :: Int)) -> multiply2 a b == a * b
    prop "multiply3" $
      \(Positive (a :: Int), Positive (b :: Int)) -> multiply3 a b == a * b
    prop "multiply4" $
      \(Positive (a :: Int), Positive (b :: Int)) -> multiply4 a b == a * b
