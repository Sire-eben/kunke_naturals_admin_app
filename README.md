# Kunke Naturals

## Getting Started 🚀

This project contains 2 flavors:

- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

## Build App

```sh
$ ./build.sh <environment> <platform>
```

## Code gen

- use fluttergen to generate assets code, see how to setup locally here https://pub.dev/packages/flutter_gen
- see `runner.sh` script for hive adapter code gen
