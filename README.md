## [![pub package](https://appsonair.com/images/logo.svg)](https://cocoapods.org/pods/AppsOnAir-AppSync)
# AppsOnAir-AppSync

[![Version](https://img.shields.io/cocoapods/v/AppsOnAir-AppSync.svg?style=flat)](https://cocoapods.org/pods/AppsOnAir-AppSync)
[![License](https://img.shields.io/cocoapods/l/AppsOnAir-AppSync.svg?style=flat)](https://cocoapods.org/pods/AppsOnAir-AppSync)

## Overview

AppsOnAir-AppSync is an iOS CocoaPod that enforces mandatory app updates and manages app state dynamically based on network conditions, ensuring version compliance and optimal performance.

⭐️ Compatible with Objective-C, Swift, and SwiftUI


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Minimum deployment target: 12.0

## Installation

AppsOnAir-AppSync is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppsOnAir-AppSync'
```
## Usages
 Write code in AppDelegate file if you want to start on app launch.

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
