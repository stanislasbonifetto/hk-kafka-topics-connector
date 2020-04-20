{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( runConsumerExample
    ) where

import Control.Exception (bracket)
import Data.Monoid ((<>))
import Kafka.Consumer

-- Global consumer properties
consumerProps :: ConsumerProperties
consumerProps = brokersList [BrokerAddress "localhost:9092"]
             <> groupId (ConsumerGroupId "consumer_example_group")
             <> noAutoCommit
             <> logLevel KafkaLogInfo

-- Subscription to topics
consumerSub :: Subscription
consumerSub = topics [TopicName "kafka-client-example-topic"]
           <> offsetReset Latest

-- Running consumer
runConsumer :: IO ()
runConsumer = do
    res <- bracket mkConsumer clConsumer runHandler
    print res
    where
      mkConsumer = newConsumer consumerProps consumerSub
      clConsumer (Left err) = return (Left err)
      clConsumer (Right kc) = maybe (Right ()) Left <$> closeConsumer kc
      runHandler (Left err) = return (Left err)
      runHandler (Right kc) = processMessages kc

-------------------------------------------------------------------
processMessages :: KafkaConsumer -> IO (Either KafkaError ())
processMessages kafka = do
    msg1 <- pollMessage kafka (Timeout 1000)
    putStrLn $ "Message: " <> show msg1
    err <- commitAllOffsets OffsetCommit kafka
    putStrLn $ "Offsets: " <> maybe "Committed." show err
    processMessages kafka
    return $ Right ()    