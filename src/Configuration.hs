{-# LANGUAGE OverloadedStrings #-}
module Configuration (
    AppConfiguration(..),
    local
) where

import Kafka.Types

data AppConfiguration = MakeAppConfiguration
    {   name :: String
    ,   brokers :: [BrokerAddress]
    ,   topicFrom :: TopicName
    ,   topicTo :: TopicName
    }

defaultConfig :: AppConfiguration
defaultConfig = MakeAppConfiguration 
    { name = "default"
    , brokers = [BrokerAddress "localhost:9092"]
    , topicFrom = TopicName "topic-a"
    , topicTo = TopicName "topic-b"
    }    

local :: AppConfiguration
local = defaultConfig { name = "local" }