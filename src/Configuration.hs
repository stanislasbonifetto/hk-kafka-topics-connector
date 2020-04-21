{-# LANGUAGE OverloadedStrings #-}
module Configuration
    where

data AppConfiguration = MakeAppConfiguration
    {   name :: String
    ,   brokers :: [String]
    }

local :: AppConfiguration
local = MakeAppConfiguration 
    { name = "local"
    , brokers = ["localhost:9092"]
    }