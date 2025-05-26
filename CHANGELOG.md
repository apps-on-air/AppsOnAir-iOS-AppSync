## 0.6.0

* Add XCFramework for enhanced security and Upgrade dependency.

## 0.5.0

* Upgrade dependency

## 0.4.0

* Standardized the update alert response across platforms.

**Breaking Changes:**

* There are breaking changes in the sync method. Moving forward, the update response will be shared based on the respective Android and iOS platforms. Detailed changes to the properties are outlined below.

    * Replaced `iosBuildNumber` with `buildNumber`
    * Replaced `isIOSUpdate` with `isUpdateEnabled`
    * Replaced `isIOSForcedUpdate` with `isForcedUpdate`
    * Replaced `iosMinBuildVersion` with `minBuildVersion`
    * Replaced `iosUpdateLink` with `updateLink`

## 0.3.0

* Added manually update alert callback

## 0.2.0

* React native assets (resource) issue resolved

## 0.1.0

* Initial Release