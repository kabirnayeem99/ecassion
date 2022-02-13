# Ecassion

Cross platform mobile application for event management.

# Architecture

This project makes use
of [Uncle Bob's clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
.

![](https://miro.medium.com/max/556/0*zUtZYiJ1bDTugOYY)

It is divided into three modules, namely data, domain and ui.

# Build

## Requirements

Make sure you have Flutter version `2.10.0` and Dart version `2.16.1` installed.

To run this app on android devices, you need -

- Android SDK
- Platform android-30 or more, build-tools `30.0.0` or more
- Java binary
- Java version OpenJDK Runtime Environment (build `11.0.11+0-b60-7772763`)
- All Android licenses accepted.

To run this app on iOS devices, you need -

- Xcode
- CocoaPods version `1.11.2` or more.

## Build instructions

Make sure everything is fine and ok by running-

`flutter doctor -v`

This project uses `Freezed` code generator for its data classes. You need to first generate the
freezed files by running-

`flutter pub run build_runner build`

Then you need to open a simulator by running-

`open -a simulator`

Or you need to open an Android Emulator-

`/Users/username/Library/Android/sdk/emulator/emulator -avd emulator_name -netdelay none -netspeed full`

Then you can run the project by first cloning it from Git-

`git clone https://github.com/kabirnayeem99/ecassion.git`

And then by going into the directory and running the project-

`cd ecassion`

`flutter pub get`

`flutter run`

# Packages

- [cupertino_icons](https://pub.dev/packages/cupertino_icons), an asset repo containing the default
  set of icon assets used by Flutter's Cupertino widgets.
- [flutter_svg](https://pub.dev/packages/flutter_svg), for drawing SVG files on a Flutter Widget.
- [freezed](https://pub.dev/packages/freezed), code generator for unions/pattern-matching/copy in
  data classes.
- [cached_network_image](https://pub.dev/packages/cached_network_image), to show images from the
  internet and keep them in the cache directory.
- [faker](https://pub.dev/packages/faker), for generating fake data.
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons), a command-line tool
  which simplifies the task of updating Flutter app's launcher icon.

# Design

Design
link: [Figma](https://www.figma.com/file/S5pOCl2NoOYonPbOIMQqBN/Event-booking-app-(Community)?node-id=107%3A1033)