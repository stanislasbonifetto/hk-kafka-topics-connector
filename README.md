# hk-kafka-topics-connector
Haskell kafka project to:

consume from `topic-a` -> `message-a` -> transform -> `message-b` -> produce to -> `topic-b`

# System Dependencies
The project use [hw-kafka-client](https://github.com/haskell-works/hw-kafka-client) that is a haskell binding around the C library.
To run the project you need the install the C library [librdkafka](https://github.com/edenhill/librdkafka)
To install on OSX:
```
brew install librdkafka
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

# Troubleshooting
## * Missing (or bad) C library: rdkafka
If see log like this you need install the C kafka client lib [hw-kafka-client](https://github.com/haskell-works/hw-kafka-client)
```
Stack has not been tested with GHC versions above 8.6, and using 8.8.3, this may fail
Stack has not been tested with Cabal versions above 2.4, but version 3.0.1.0 was found, this may fail
hw-kafka-client          > configure
hw-kafka-client          > Configuring hw-kafka-client-3.1.0...
hw-kafka-client          > Cabal-simple_mPHDZzAJ_3.0.1.0_ghc-8.8.3: Missing dependency on a foreign
hw-kafka-client          > library:
hw-kafka-client          > * Missing (or bad) C library: rdkafka
hw-kafka-client          > This problem can usually be solved by installing the system package that
hw-kafka-client          > provides this library (you may need the "-dev" version). If the library is
hw-kafka-client          > already installed but in a non-standard location then you can use the flags
hw-kafka-client          > --extra-include-dirs= and --extra-lib-dirs= to specify where it is.If the
hw-kafka-client          > library file does exist, it may contain errors that are caught by the C
hw-kafka-client          > compiler at the preprocessing stage. In this case you can re-run configure
hw-kafka-client          > with the verbosity flag -v3 to see the error messages.
hw-kafka-client          >

--  While building package hw-kafka-client-3.1.0 using:
      /Users/bonifets/.stack/setup-exe-cache/x86_64-osx/Cabal-simple_mPHDZzAJ_3.0.1.0_ghc-8.8.3 --builddir=.stack-work/dist/x86_64-osx/Cabal-3.0.1.0 configure --user --package-db=clear --package-db=global --package-db=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/pkgdb --libdir=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/lib --bindir=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/bin --datadir=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/share --libexecdir=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/libexec --sysconfdir=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/etc --docdir=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/doc/hw-kafka-client-3.1.0 --htmldir=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/doc/hw-kafka-client-3.1.0 --haddockdir=/Users/bonifets/.stack/snapshots/x86_64-osx/7fbd5e8cbb82f89d8e0a919a819c44c0832186eb118b1ed425a549d99b3f4fbe/8.8.3/doc/hw-kafka-client-3.1.0 --dependency=base=base-4.13.0.0 --dependency=bifunctors=bifunctors-5.5.7-J3zEkitvo5e6gFaUUDqim5 --dependency=bytestring=bytestring-0.10.10.0 --dependency=containers=containers-0.6.2.1 --dependency=text=text-1.2.4.0 --dependency=transformers=transformers-0.5.6.2 --dependency=unix=unix-2.7.2.2 -f-examples --exact-configuration --ghc-option=-fhide-source-paths
    Process exited with code: ExitFailure 1
Progress 1/2
```