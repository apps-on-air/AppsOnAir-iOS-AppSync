// ObjC bridge for AppsOnAir_AppSync Swift module.
// Uses runtime class lookup to avoid a compile-time ObjC/Swift name conflict.
// The public interface lives in include/AppsOnAir_AppSync-Swift.h for consumers.
//
// Swift registers @objc framework classes with their module-qualified name
// (e.g. "AppsOnAir_AppSync.AppSyncService"), so this ObjC class
// ("AppSyncService") and the Swift class coexist without a symbol collision.
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Redeclare the public interface inline so this file needs no header search path.
@interface AppSyncService : NSObject
+ (instancetype)shared;
- (void)syncWithDirectory:(NSDictionary *)directory
               completion:(void (^)(NSDictionary *result))completion;
@end

NS_ASSUME_NONNULL_END

@interface AppSyncService ()
// Stored as opaque `id` to avoid importing the Swift module and causing a
// redefinition conflict with the Swift-exported `AppSyncService`.
@property(nonatomic, strong) id swiftService;
@end

@implementation AppSyncService

+ (instancetype)shared {
    static AppSyncService *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Resolve the Swift class at runtime to avoid a compile-time name conflict.
        Class swiftClass = NSClassFromString(@"AppsOnAir_AppSync.AppSyncService");
        NSAssert(swiftClass != nil,
                 @"AppsOnAir_AppSync framework must be linked. "
                 @"Make sure AppsOnAir-AppSync is added as a dependency.");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        _swiftService = [swiftClass performSelector:NSSelectorFromString(@"shared")];
#pragma clang diagnostic pop
    }
    return self;
}

- (void)syncWithDirectory:(NSDictionary *)directory
               completion:(void (^)(NSDictionary *))completion {
    SEL sel = NSSelectorFromString(@"syncWithDirectory:completion:");
    NSMethodSignature *sig = [self.swiftService methodSignatureForSelector:sel];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
    [inv setSelector:sel];
    [inv setTarget:self.swiftService];
    [inv setArgument:&directory atIndex:2];
    id block = ^(NSDictionary *result) {
        if (completion) completion(result);
    };
    [inv setArgument:&block atIndex:3];
    [inv invoke];
}

@end
