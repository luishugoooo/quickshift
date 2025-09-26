
> [!IMPORTANT]  
> Due to limited freetime this project is dormant. Connecting and managing a remote Transmission instance works quite well, however I will not continue to work on this project at this time.

# Quickshift

## Introduction
Quickshift is a powerful and easy-to-use remote torrenting client that aims to support most major torrent software ([see integrations](#Integrations)). It is fast, easy to use and features a rich and modern user interface implemented in Flutter.

## Usage
Either download a precompiled binary or installer from the [releases](https://github.com/FantixX/quickshift/releases/latest) page or [build the project yourself](#Build-yourself).

## Integrations
Quickshift supports the following torrent software (🟢 = stable, 🔵 = in development, 🟡 = planned, 🔴 = not planned):
- 🔵 Transmission
- 🟡 qBittorrent
- 🟡 Deluge
- 🟡 uTorrent

## Roadmap
- [ ] Use proper popout windows (waiting for [support in flutter](https://github.com/flutter/flutter/issues/142845#issuecomment-2087374780))

## Build yourself
To build the project yourself, follow these steps:
1. Obtain a [Flutter](https://docs.flutter.dev/get-started/install) installation (including platform specific dependencies).
2. Clone this repository.
3. Run `flutter pub get` in the project root directory.
4. Run `flutter build <platform>` to build the project for your desired platform.
5. The compiled binary will be located in the `build/<platform>/` directory.





### License
The source code for this project is released under the MIT License. See the [LICENSE](LICENSE) file for more details.

