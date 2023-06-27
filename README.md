# Fancy Logger

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: AGPLv3][license_badge]][license_link]
[![app](https://github.com/broxus/fancy_logger/actions/workflows/main.yaml/badge.svg)](https://github.com/broxus/fancy_logger/actions/workflows/main.yaml)

The Logging Library for Flutter with SQLite Integration is a powerful and easy-to-use logging solution for Flutter applications. It provides a seamless way to log events, errors, and debug information in your Flutter projects while storing the logs in a SQLite database. Additionally, the library offers the capability to export logs in JSON format.

## Installation 💻

**❗ In order to start using Fancy Logger you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `fancy_logger` to your `pubspec.yaml`:

```yaml
dependencies:
  fancy_logger:
```

Install it:

```sh
flutter packages get
```

## Basic usage 🛠

Setup DI:

```dart
@InjectableInit(  
  externalPackageModulesBefore: [
    ExternalModule(FancyLoggerPackageModule),
  ],
)  
void configureDependencies() => getIt.init();  
```

Init:

```dart
Future<void> configureLogger() async {
  final fancyLogger = inject<FancyLogger>();
  await fancyLogger.init({Level.ALL: 100});
}
```

---

## Continuous Integration 🤖

Fancy Logger comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].

---

## Running Tests 🧪

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate very_good_cli
```

To run all unit tests:

```sh
very_good test --coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-AGPLv3-blue.svg
[license_link]: https://opensource.org/license/agpl-v3/
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
