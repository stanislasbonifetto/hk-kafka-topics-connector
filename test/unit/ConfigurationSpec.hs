{-# LANGUAGE OverloadedStrings #-}
module ConfigurationSpec where

import Test.Hspec
import Configuration
import Kafka.Types

spec :: Spec
spec = do
  describe "local" $ do
    it "name" $ do
      name local `shouldBe` "local"
    
    it "brokers" $ do
      brokers local `shouldBe` [BrokerAddress "localhost:9092"]