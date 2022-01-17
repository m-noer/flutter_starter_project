.Nero: format
format:
	flutter format lib test

.Nero: test
test:
	flutter test --coverage

.Nero: integrate_test
integrate_test:
	flutter drive --flavor staging --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart

.Nero: feature
feature:
	mason make nero_feature -c assets/json/$(name).json -o lib

.Nero: analyze
analyze:
	flutter analyze lib test

.Nero: runner
runner:
	flutter pub run build_runner build --delete-conflicting-outputs

.Nero: build_runner
build_runner:
	flutter pub run build_runner build

.Nero: icon
icon:
	flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*
