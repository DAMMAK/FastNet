# FastNet

[![GitHub code](https://img.shields.io/github/languages/code-size/dammak/FastNet)](https://github.com/DAMMAK/FastNet)[![GitHub Releases](https://img.shields.io/github/downloads/dammak/FastNet/total)](https://github.com/DAMMAK/FastNet)[![GitHub](https://img.shields.io/github/license/dammak/FastNet)](https://github.com/DAMMAK/FastNet)

```
 A Dart package that allows you to test your network download and upload speed using [fast.com](https://fast.com)

```

## Install

```dart
dependencies:
  fastnet: ^0.0.1

```

## Usage

```dart

var fastnet = FastNet(isListenable: false);
var response = await fastnet.getSpeed();
  response.listen((Result event) {
    print(event.downloadSpeedValue);
  });

```

### Inspired
https://github.com/sindresorhus/fast-cli
