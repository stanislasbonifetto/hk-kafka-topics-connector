# hk-kafka-topics-connector
Haskell kafka project to:

consume from `topic-a` -> `message-a` -> transform -> `message-b` -> produce to -> `topic-b`

# Local env
To run in local environment you could run the dependencies via docker-compose
```
docker-compose up -d
```