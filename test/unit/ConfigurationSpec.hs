{-# LANGUAGE OverloadedStrings #-}
module ConfigurationSpec where

import Test.Hspec
import Configuration
import Kafka.Types

spec :: Spec
spec = do
  describe "local configuration" $ do
    it "name" $ do
      name local `shouldBe` "local"
    
    it "brokers" $ do
      brokers local `shouldBe` [BrokerAddress "localhost:9092"]
    
    it "topicFrom" $ do
      topicFrom local `shouldBe` TopicName "topic-a"
    
    it "topicTo" $ do
      topicTo local `shouldBe` TopicName "topic-b"