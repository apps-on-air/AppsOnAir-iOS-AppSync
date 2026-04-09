## [![pub package](https://appsonair.com/images/logo.svg)](https://cocoapods.org/pods/AppsOnAir-AppSync)
# AppsOnAir-AppSync

[![Version](https://img.shields.io/cocoapods/v/AppsOnAir-AppSync.svg?style=flat)](https://cocoapods.org/pods/AppsOnAir-AppSync)
[![License](https://img.shields.io/cocoapods/l/AppsOnAir-AppSync.svg?style=flat)](https://cocoapods.org/pods/AppsOnAir-AppSync)

## Overview

AppsOnAir-AppSync is an iOS CocoaPod that enforces mandatory app updates and manages app state dynamically based on network conditions, ensuring version compliance and optimal performance.

⭐️ Compatible with Objective-C, Swift, and SwiftUI


## Requirements

Minimum deployment target: iOS 12.0

## Installation

### Swift Package Manager

Add the package to your project using Xcode:

1. Go to **File > Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/apps-on-air/AppsOnAir-iOS-AppSync.git
   ```
3. Select the version or branch you want to use, then click **Add Package**.

Or add it directly to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/apps-on-air/AppsOnAir-iOS-AppSync.git", from: "1.2.1")
]
```

Then add `"AppsOnAir-AppSync"` to your target's dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: ["AppsOnAir-AppSync"]
)
```

### CocoaPods

AppsOnAir-AppSync is available through [CocoaPods](https://cocoapods.org). Add the following line to your Podfile:

```ruby
pod 'AppsOnAir-AppSync'
```

Then run `pod install`.

## USAGE 
Add application id in your app info.plist file.
```xml
<key>AppsonairAppId</key>
<string>XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX</string>
```
how to get application id for more details check this [URL](https://documentation.appsonair.com/MobileQuickstart/GettingStarted)


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
    let appsOnAirSyncService = AppSyncService.shared

    # AppsOnAirCore common services Initialization
    appsOnAirSyncService.sync(directory: ["showNativeUI":false]) { appUpdateData in
            # Write the code here when showNative UI is false
      }
```

Objective C :
```ruby
@interface AppDelegate ()
@property (nonatomic, strong) AppSyncService *appSyncService;
@end

    # App Sync Class instance create
    self.appSyncService =  [AppSyncService shared];
    
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
