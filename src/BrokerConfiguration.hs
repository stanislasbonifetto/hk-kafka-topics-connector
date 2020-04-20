{-# LANGUAGE OverloadedStrings #-}
module BrokerConfiguration
    ( brokers
    ) where

import Kafka.Consumer

brokers :: [BrokerAddress]
brokers = [BrokerAddress "localhost:9092"]