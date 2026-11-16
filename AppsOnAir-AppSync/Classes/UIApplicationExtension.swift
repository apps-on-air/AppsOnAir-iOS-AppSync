#if canImport(UIKit)
import Foundation

import UIKit

extension UIApplication {
    /// Key window of the foreground-active scene (falls back to any connected window scene).
    /// `UIApplication.keyWindow` is deprecated and unreliable under the UIScene life cycle required from iOS 27.
    static var activeKeyWindow: UIWindow? {
        let windowScenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        let orderedScenes = windowScenes.filter { $0.activationState == .foregroundActive }
            + windowScenes.filter { $0.activationState != .foregroundActive }
        for scene in orderedScenes {
            if let keyWindow = scene.windows.first(where: { $0.isKeyWindow }) ?? scene.windows.first {
                return keyWindow
            }
        }
        return nil
    }

    class func topMostViewController(controller: UIViewController? = UIApplication.activeKeyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topMostViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topMostViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topMostViewController(controller: presented)
        }
        return controller
    }
}
#endif
