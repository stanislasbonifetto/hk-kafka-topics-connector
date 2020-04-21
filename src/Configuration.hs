{-# LANGUAGE OverloadedStrings #-}
module Configuration
    (
        AppConfiguration,
        local,
        name,
        brokers
    ) where

data AppConfiguration = MakeAppConfiguration
    {   name :: String
    ,   brokers :: [String]
    }

local :: AppConfiguration
local = MakeAppConfiguration 
    { name = "local"
    , brokers = ["localhost:9092"]
    }