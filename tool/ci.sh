#!/usr/bin/env bash

set -e -o pipefail

dart pub upgrade

dart format --output none --set-exit-if-changed .

dart analyze --fatal-infos

dart pub global activate coverage

# Looses --reporter=compact feature
# dart pub global run coverage:test_with_coverage

rm -rf coverage/test
dart test --coverage=coverage
dart pub global run coverage:format_coverage \
  --in coverage/test/ \
  --out coverage/lcov.info \
  --report-on lib \
  --base-directory . \
  --lcov \
  --check-ignore

lcov --list coverage/lcov.info \
  | grep -v ".*|.*100%.*|.*|"

dart pub global activate pana
dart pub global run pana --no-warning

dart pub publish --dry-run

git diff --stat --exit-code
