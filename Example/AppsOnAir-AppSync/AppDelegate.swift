import UIKit
import AppsOnAir_AppSync

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //MARK: - Declarations
        //AppsOnAir AppSync ios services Initialization
        let appsOnAirSyncServices = AppSyncService.shared

        //MARK: - View Methods
        //Help to enable sync manager for app
        appsOnAirSyncServices.sync(directory: ["showNativeUI":true]) { appUpdateData in
            //Write the code here when showNative UI is false
        }
        // Override point for customization after application launch.
        return true
    }

    // MARK: - UISceneSession Lifecycle
    // Apps built with the iOS 27 SDK must use the UIScene life cycle.

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // The window and root view controller are created from Main.storyboard (UISceneStoryboardFile in Info.plist).
        guard scene is UIWindowScene else { return }
    }
}
