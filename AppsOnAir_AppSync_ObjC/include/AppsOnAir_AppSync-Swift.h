#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// ObjC interface for AppsOnAir AppSync SDK.
///
/// ─── CocoaPods (Objective-C) ─────────────────────────────────────────────────
///   #import "AppsOnAir_AppSync-Swift.h"
///
/// ─── SPM (Objective-C) ───────────────────────────────────────────────────────
///   Add "AppsOnAir-AppSync" product to your target, then:
///   #import "AppsOnAir_AppSync-Swift.h"
///
@interface AppSyncService : NSObject

/// Shared singleton instance.
+ (instancetype)shared;

/// Sync app update status using a config dictionary.
/// @param directory  Config dictionary. Pass @{@"showNativeUI": @YES} to show
///                   the built-in update/maintenance UI, or @NO to handle the
///                   result yourself.
/// @param completion Called with a result dictionary on completion.
- (void)syncWithDirectory:(NSDictionary *)directory
               completion:(void (^)(NSDictionary *result))completion;

@end

NS_ASSUME_NONNULL_END
