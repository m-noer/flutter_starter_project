.PHONY: format
format:
	flutter format lib test

.PHONY: test
test:
	flutter test --coverage

.PHONY: feature
feature:
	mason make nero_feature -c assets/json/$(name).json -o lib

.PHONY: analyze
analyze:
	flutter analyze lib test

.PHONY: runner
runner:
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: build_runner
build_runner:
	flutter pub run build_runner build
