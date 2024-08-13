# flutter workspaces bug

## steps to reproduce

1. add `flutter` as a dependency in the root workspace pubspec.
2. add `flutter` as a dependency to a nested package.
3. run `flutter pub get` in the nested package's directory

## observed error

The following error is received

```console

[nested_a] flutter pub get --no-example
Resolving dependencies in `/Users/pattobrien/dev/bugs/build_runner_workspaces`...
Downloading packages...
  _fe_analyzer_shared 72.0.0 (73.0.0 available)
  analyzer 6.7.0 (6.8.0 available)
  build_runner 2.4.11 (2.4.12 available)
  build_runner_core 7.3.1 (7.3.2 available)
  collection 1.18.0 (1.19.0 available)
  coverage 1.8.0 (1.9.0 available)
  http_parser 4.0.2 (4.1.0 available)
  material_color_utilities 0.11.1 (0.12.0 available)
  shelf 1.4.1 (1.4.2 available)
Got dependencies in `/Users/pattobrien/dev/bugs/build_runner_workspaces`!
9 packages have newer versions incompatible with dependency constraints.
Try `flutter pub outdated` for more information.
LocalDirectory: '/Users/pattobrien/dev/bugs/build_runner_workspaces/nested_a': pub did not create .dart_tools/package_config.json file.
exit code 1
```

## additional environment info

```console
❯ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.24.0, on macOS 14.4.1 23E224 darwin-arm64, locale en-US)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0-rc1)
[✓] Xcode - develop for iOS and macOS (Xcode 15.4)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.1)
[✓] VS Code (version 1.92.0)
```


# RESOLVED: build_runner workspaces bug

## steps to reproduce

1. in directory `/nested_a`, run the following command:

```console
dart run build_runner watch -d
```

build_runner crashes with the following output

```console
Building package executable... 
Built build_runner:build_runner.
[INFO] Generating build script completed, took 482ms
[INFO] Precompiling build script... completed, took 3.8s
[INFO] Setting up file watchers completed, took 19ms
[INFO] Waiting for all file watchers to be ready completed, took 198ms


You have hit a bug in build_runner
Please file an issue with reproduction steps at https://github.com/dart-lang/build/issues


AssetNotFoundException: nested_a|.dart_tool/package_config.json
package:build_runner_core/src/asset/file_based.dart 135:18  _fileForOrThrow.<fn>
dart:async                                                  _CustomZone.runUnary
package:build_runner_core/src/asset/file_based.dart 35:13   FileBasedAssetReader.readAsBytes.<fn>
package:build_runner/src/generate/watch_impl.dart 336:11    WatchImpl._run.<fn>
```

## additional info

- Dart SDK version: 3.5.0-311.0.dev (dev) (Thu Jun 27 13:01:59 2024 -0700) on "macos_x64"
- tested with `build_runner v2.4.11` (latest release)