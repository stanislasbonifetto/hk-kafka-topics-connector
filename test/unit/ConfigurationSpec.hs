module ConfigurationSpec where

import Test.Hspec
import Configuration

spec :: Spec
spec = do
  describe "local" $ do
    it "name" $ do
      name local `shouldBe` "local"
    
    it "brokers" $ do
      brokers local `shouldBe` ["localhost:9092"]