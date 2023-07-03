<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

[![ci](https://github.com/hrishikesh-kadam/hrk_logging.dart/actions/workflows/ci.yaml/badge.svg)](https://github.com/hrishikesh-kadam/hrk_logging.dart/actions/workflows/ci.yaml)
[![codecov](https://codecov.io/gh/hrishikesh-kadam/hrk_logging.dart/branch/main/graph/badge.svg)](https://codecov.io/gh/hrishikesh-kadam/hrk_logging.dart)

Colorful logs by HRK

## Features

- Colorful Logs
- Relevant Emojis
- Support for log.debug()
- Hierarchical logging is enabled
- Root Logger is set to `Level.ALL` in kDebugMode, else set to `Level.INFO`
- Root Logger is set to `Level.OFF` in Dart and Flutter Test  
  See [lib/src/helper/helper_non_web.dart][]

## Getting started

```console
dart pub add hrk_logging
```

## Usage

```dart
import 'package:hrk_logging/hrk_logging.dart';

void main() {
  configureHrkLogging();
  final log = Logger('HrkLogger')..level = Level.ALL;
  log.shout('sample shout');
  log.severe('sample severe');
  log.warning('sample warning');
  log.info('sample info');
  log.config('sample config');
  log.debug('sample debug');
  log.fine('sample fine');
  log.finer('sample finer');
  log.finest('sample finest');
}
```

## Additional information

- This package is intended for the beginners.
- If you find this package useful, make sure you do the following
  - Like the original [logging][] package on pub.dev
  - Like this package on pub.dev


[lib/src/helper/helper_non_web.dart]: lib/src/helper/helper_non_web.dart
[logging]: https://pub.dev/packages/logging
