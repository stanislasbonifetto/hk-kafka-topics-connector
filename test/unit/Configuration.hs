data AppConfiguration = MakeAppConfiguration
    {   name :: String
    ,   brokers :: [BrokerAddress]
    }

local :: AppConfiguration
local = MakeAppConfiguration 
    { name = "local"
    , brokers = ["localhost:9002"]}