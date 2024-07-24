# build_runner workspaces bug

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