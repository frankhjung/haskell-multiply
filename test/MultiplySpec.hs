{-# LANGUAGE ScopedTypeVariables #-}

module MultiplySpec (spec) where

import           Multiply              (multiply0, multiply1, multiply2,
                                        multiply3, multiply4)

import           Test.Hspec            (Spec, describe)
import           Test.Hspec.QuickCheck (prop)

spec :: Spec
spec =
  describe"multiplication algorithms for natural numbers" $ do
    prop "multiply0" $
      \(a :: Word, b :: Word) -> multiply0 a b == a * b
    prop "multiply1" $
      \(a :: Word, b :: Word) -> multiply1 a b == a * b
    prop "multiply2" $
      \(a :: Word, b :: Word) -> multiply2 a b == a * b
    prop "multiply3" $
      \(a :: Word, b :: Word) -> multiply3 a b == a * b
    prop "multiply4" $
      \(a :: Word, b :: Word) -> multiply4 a b == a * b
