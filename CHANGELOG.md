## 1.4.0

* Added iOS 27 / Xcode 27 support
* Raised minimum deployment target to iOS 15.0 (minimum supported by Xcode 27)
* Requires AppsOnAir-Core 1.3.0 or later (NWPathMonitor-based network monitoring; ReachabilitySwift removed)
* Resolve the presenting window via connected scenes instead of deprecated `keyWindow` (UIScene life cycle)

## 1.3.2

* Relaxed AppsOnAir-Core dependency version constraint

## 1.3.1

* Minor improvement and fixes

## 1.3.0

* Added Swift Package Manager (SPM) support

## 1.2.1

* Dependency upgrade

## 1.2.0

* Dependency upgrade

## 0.6.3

* Dependency upgrade

## 0.6.2

* Minor improvement and fixes

## 0.6.1

* Default maintenance icon issue resolved
* Minor improvement 

## 0.6.0

* Add XCFramework for enhanced security and Dependency upgrade.

## 0.5.0

* Dependency upgrade

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