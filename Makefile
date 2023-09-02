FVM := $(shell which fvm)
FLUTTER := $(FVM) flutter

.PHONY: setup
setup:
	dart pub global activate fvm
	fvm install

.PHONY: get-dependencies
get-dependencies:
	$(FLUTTER) pub get

.PHONY: clean
clean:
	$(FLUTTER) clean

.PHONY: analyze

analyze:
	$(FLUTTER) analyze
	$(FVM) dart run custom_lint

.PHONY: format
format:
	$(FLUTTER) format lib/

.PHONY: format-dry-exit-if-changed
format-dry-exit-if-changed:
	$(FLUTTER) format --dry-run --set-exit-if-changed lib/

.PHONY: build-runner
build-runner:
	$(FLUTTER) packages pub run build_runner build --delete-conflicting-outputs

.PHONY: test
test:
	make analyze
	$(FLUTTER) test

.PHONY: flutter-native-splash
flutter-native-splash:
	$(FLUTTER) pub run flutter_native_splash:create

.PHONY: flutter-launcher-icons
flutter-launcher-icons:
	$(FLUTTER) pub run flutter_launcher_icons:main

.PHONY: analytics-android-enable
analytics-android-enable:
	adb shell setprop debug.firebase.analytics.app jp.tctc.itpassport.dev

.PHONY: analytics-android-disable
analytics-android-disable:
	adb shell setprop debug.firebase.analytics.app .none.

### Web Relase Commands

.PHONY: build-web-dev-app
build-web-dev-app:
	make get-dependencies
	$(FLUTTER) build web \
		--web-renderer html \
		--release \
		--dart-define=HOSTING=app \
		--dart-define=FLAVOR=dev

.PHONY: deploy-web-dev-app
deploy-web-dev-app:
	make build-web-dev-app
	firebase deploy --only hosting:app --project=dev

.PHONY: build-web-dev-test
build-web-dev-test:
	make get-dependencies
	$(FLUTTER) build web \
		--web-renderer html \
		--release \
		--dart-define=HOSTING=test \
		--dart-define=FLAVOR=dev

.PHONY: deploy-web-dev-test
deploy-web-dev-test:
	make build-web-dev-test
	firebase deploy --only hosting:test --project=dev

.PHONY: build-web-prod-test
build-web-prod-test:
	make get-dependencies
	$(FLUTTER) build web \
		--web-renderer html \
		--release \
		--dart-define=HOSTING=test \
		--dart-define=FLAVOR=prod

.PHONY: deploy-web-prod-test
deploy-web-prod-test:
	make build-web-prod-test
	firebase deploy --only hosting:test --project=prod

### Android Relase Commands

.PHONY: build-android-dev
build-android-dev:
	$(FLUTTER) build appbundle \
		--release \
		--build-number $(BUILD) \
		--dart-define=HOSTING=app \
		--dart-define=FLAVOR=dev \
		--flavor dev

.PHONY: build-android-prod
build-android-prod:
	$(FLUTTER) build appbundle \
		--release \
		--build-number $(BUILD) \
		--dart-define=HOSTING=app \
		--dart-define=FLAVOR=prod \
		--flavor prod

### iOS Relase Commands

.PHONY: build-ios-dev
build-ios-dev:
	$(FLUTTER) build ipa \
		--export-options-plist=ios/ExportOptions_dev.plist \
		--release \
		--build-number $(BUILD) \
		--dart-define=HOSTING=app \
		--dart-define=FLAVOR=dev \
		--flavor dev

.PHONY: build-ios-prod
build-ios-prod:
	$(FLUTTER) build ipa \
		--export-options-plist=ios/ExportOptions_prod.plist \
		--release \
		--build-number $(BUILD) \
		--dart-define=HOSTING=app \
		--dart-define=FLAVOR=prod \
		--flavor prod
