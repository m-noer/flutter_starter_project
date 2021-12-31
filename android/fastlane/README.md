fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## Android
### android firebase_distribution
```
fastlane android firebase_distribution
```
deploy android to firebase distribution
### android upload_to_play_store_internal
```
fastlane android upload_to_play_store_internal
```
deploy android to internal testing play store
### android promote_internal_to_production
```
fastlane android promote_internal_to_production
```
Promote internal to Production

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
