## [![pub package](https://appsonair.com/images/logo.svg)](https://cocoapods.org/pods/AppsOnAir-AppSync)
# AppsOnAir-AppSync

[![Version](https://img.shields.io/cocoapods/v/AppsOnAir-AppSync.svg?style=flat)](https://cocoapods.org/pods/AppsOnAir-AppSync)
[![License](https://img.shields.io/cocoapods/l/AppsOnAir-AppSync.svg?style=flat)](https://cocoapods.org/pods/AppsOnAir-AppSync)

## Overview

AppsOnAir-AppSync is an iOS CocoaPod that enforces mandatory app updates and manages app state dynamically based on network conditions, ensuring version compliance and optimal performance.

⭐️ Compatible with Objective-C, Swift, and SwiftUI


## Installation

AppsOnAir-AppSync is available through [CocoaPods](https://cocoapods.org). To use or install AppsOnAir-AppSync with CocoaPods,
simply add the following line to your Podfile:

```ruby
pod 'AppsOnAir-AppSync'
```

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. To use AppsOnAir-AppSync with Swift Package Manger, add it to `dependencies` in your `Package.swift`

```swift
dependencies: [
    .package(url: "https://github.com/apps-on-air/AppsOnAir-iOS-AppSync.git")
]
```

## Requirements

Minimum deployment target: 12.0

## Installation

AppsOnAir-AppSync is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppsOnAir-AppSync'
```
## USAGE 
Add APIKey in your app info.plist file.
```xml
<key>AppsOnAirAPIKey</key>
<string>XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX</string>
```
how to get APIKey for more details check this [URL](https://documentation.appsonair.com/Mobile-Quickstart/ios-sdk-setup)


### Write code in AppDelegate file if you want to start on app launch.

Firstly, import AppsOnAir_AppSync in appDelegate

Swift / SwiftUI
```swift
import AppsOnAir_AppSync
```
Objective-c

```swift
#import "AppsOnAir_AppSync-Swift.h"
```

### App-Sync Implement Code

Swift Ui / Swift : 
```ruby
    # AppsOnAirAppSync class object
    let appOnAirSyncService = AppSyncService()

    # AppsOnAirCore common services Initialization
    appOnAirSyncService.sync(directory: ["showNativeUI":false]) { appUpdateData in
            # Write the code here when showNative UI is false
      }
```

Objective C :
```ruby
@interface AppDelegate ()
@property (nonatomic, strong) AppSyncService *appSyncService;
@end

    # App Sync Class instance create
    self.appSyncService = [[AppSyncService alloc] init];
    
    #  Help to enable sync manager for app with directory for showNativeUi handling and completion method
    [self.appSyncService syncWithDirectory:@{@"showNativeUI":@NO} completion:^(NSDictionary *appUpdate) {
      #    Write the code here when showNative UI is false
    }];
```

## Author

devtools-logicwind, devtools@logicwind.com

## License

AppsOnAir-AppSync is available under the MIT license. See the LICENSE file for more info.

## More Information  
For more details, check out [this link](https://documentation.appsonair.com/) 
