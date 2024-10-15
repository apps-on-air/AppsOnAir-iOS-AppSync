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
 Write code in AppDelegate file if you want to start on app launch

Swift Ui / Swift : 
```ruby
AppsOnAirCore class object
    let appsOnAirStateServices = AppsOnAirStateServices()

AppsOnAirCore common services Initialization
      appsOnAirStateServices.sync(directory: ["showNativeUI":false]) { appUpdateData in
          if appUpdateData["isMaintenance"] as! Int == 1 {
              print("Maintenance \(String(describing: appUpdateData["isMaintenance"]))")
          }
      }
```

Objective C :
```ruby
@interface AppDelegate ()
@property (nonatomic, strong) AppsOnAirStateServices *appsOnAirStateServices;
@end


    AppsOnAirServices Class instance create
    self.appsOnAirStateServices = [[AppsOnAirStateServices alloc] init];

   
    AppsOnAirServices initialize for network and AppId
    [self.appsOnAirStateServices syncWithDirectory:@{@"showNativeUI": @YES} completion:^(NSDictionary *appUpdateData) {
        if ([appUpdateData[@"isMaintenance"] intValue] == 1) {
            NSLog(@"Maintenance %@", appUpdateData[@"isMaintenance"]);
        }
    }];
```

## Author

devtools-logicwind, devtools@logicwind.com

## License

AppsOnAir-AppSync is available under the MIT license. See the LICENSE file for more info.
