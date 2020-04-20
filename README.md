# hk-kafka-topics-connector
Haskell kafka project to:

consume from `topic-a` -> `message-a` -> transform -> `message-b` -> produce to -> `topic-b`

# Build
## Dependencies
To build the project you need:
1. [Haskell Stack](https://docs.haskellstack.org/en/stable/README/)
2. [Nix](https://nixos.org/nix/)

### Install dependencies
1. Haskell Stack
```
curl -sSL https://get.haskellstack.org/ | sh
```

2. Nix
```
curl -L https://nixos.org/nix/install | sh
```

# Tests
The project has:
- unit tests
- integration tests

## Unit tests
The unit tests are the default tests.
To run:
```
stack test
```

## Integration tests
The Integration tests test the application as a blackbox sending messages to kafka.

To run:
1. boostrap the dependencies via [docker-compose](#local-env)
2. build the app
3. start the app
4. run the tests
```
stack run integration-test
```

# Local env
To run in local environment you could run the dependencies via docker-compose
```
docker-compose up -d
```
