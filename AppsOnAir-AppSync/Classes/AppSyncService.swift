import Foundation
import UIKit
import AVFoundation
import AppsOnAir_Core


public class AppSyncService : NSObject {
    
    @objc public static let shared = AppSyncService()
    
    //MARK: - Declarations
    private var window: UIWindow?
    
    /// help to provide AppId from AppsOnAir-core SDK and use for Force-Update
    private var appId: String = ""
    
    /// provide flags for internet connectivity
    private var isNetworkConnected: Bool? = nil
    
    /// once force Update verify this flag set to true
    private var isCheckFetchUpdate:Bool = false
    
    /// help to set the native UI
    private var showNativeUI: Bool?
    
    /// help to initialize core service class
    let appsOnAirCoreServices = AppsOnAirCoreServices()
    
    /// display message while forgot to set showNativeUI in project
    private var errorMessage:String = "AppsOnAir APIKey is Not initialized for more details: \n https://documentation.appsonair.com" // !!!: Developer Guideline URL
    
    //MARK: - Methods
    
    /// network status change handler
    private func networkStateChange(_ completion: @escaping (NSDictionary) -> () = { _ in }) {
       
        appsOnAirCoreServices.networkStatusListenerHandler { isConnected in
            //check force-update is not verify and network is connected
            if ((!(self.isCheckFetchUpdate)) && isConnected) {
                //for Force Update Alert
                self.getAppUpdate { appUpdateData in
                    completion(appUpdateData)
                }
            }
        }
    }
    
    ///handle the  alert 
    private func handleAlert(completion: @escaping (NSDictionary) -> () = { _ in },appUpdateInfo: NSDictionary) {
        //(appUpdateInfo.count > 0 || appUpdateInfo["error"] != nil) is for check force update data is not
        if((appUpdateInfo.count > 0 || appUpdateInfo["error"] != nil)){
            // (self.showNativeUI ?? false) is for check nativeUi
            if (self.showNativeUI ?? false) {
                // Force update alert for native UI
                self.presentAppUpdate(appUpdateInfo: appUpdateInfo)
            }
            // Update response for user
            var updatedAppUpdateInfo = appUpdateInfo as? [String: Any] ?? [:]
            
            // update response cross the platform
            if let updateData = updatedAppUpdateInfo["updateData"] as? [String: Any] {
                
                let newUpdateData:NSDictionary = [
                    "isUpdateEnabled": updateData["isIOSUpdate"] as? Bool ?? false,
                    "buildNumber": updateData["iosBuildNumber"] as? String ?? "",
                    "minBuildVersion": updateData["iosMinBuildVersion"] as? String ?? "",
                    "updateLink": updateData["iosUpdateLink"] as? String ?? "",
                    "isForcedUpdate": updateData["isIOSForcedUpdate"] as? Bool ?? false
                ]
                
                updatedAppUpdateInfo["updateData"] = newUpdateData
              
            }
            // Pass App Update data to the user for custom UI handling
            completion(updatedAppUpdateInfo as NSDictionary)
            //set flag is true for force-update is verified
            self.isCheckFetchUpdate = true
        }
    }
    
    ///fetch the update data of app
    private func getAppUpdate(_ completion: @escaping (NSDictionary) -> () = { _ in }){
        DispatchQueue.main.async {
            if(self.appsOnAirCoreServices.isNetworkConnected ?? false){
                //get app data from API from CDN
                AppSyncApiService.cdnRequest(self.appId) { cdnData in
                    var appUpdateInfo: NSDictionary = NSDictionary()
                    // set CDN data
                    appUpdateInfo = cdnData
                    // check get app data from API if CDN data is empty or getting error
                    if(appUpdateInfo.count == 0 || appUpdateInfo["error"] != nil) {
                        AppSyncApiService.fetchAppUpdate(self.appId) { (appUpdateData) in
                            appUpdateInfo = appUpdateData
                            self.handleAlert(completion: completion, appUpdateInfo: appUpdateInfo)
                        }
                    } else {
                        self.handleAlert(completion: completion, appUpdateInfo: appUpdateInfo)
                    }
                }
            }
        }
    }
    
    /// help to sync and network status change handler when NativeUi set to false. by default showNativeUI value is true
    @objc public func sync(directory: NSDictionary = ["showNativeUI": true],completion: @escaping (NSDictionary) -> () = { _ in }) {
        // To initialize the network services delegate and set AppId from AppsOnAir-core SDK and set Native UI
        self.showNativeUI = directory["showNativeUI"] as? Bool
        if(self.isCheckFetchUpdate) {
            self.getAppUpdate { appUpdateData in
                completion(appUpdateData)
            }
        } else {
            appsOnAirCoreServices.initialize()
            self.appId = appsOnAirCoreServices.appId
            // display message while forgot to set showNativeUI in project
            if self.appId != "" {
                // Method to set the network status change handler when NativeUi set to false
                networkStateChange { appUpdateData in
                    completion(appUpdateData)
                }
            }else {
                completion(["error":errorMessage])
            }
        }
      
    }
    
    ///help to present App Update Alert
    private func presentAppUpdate(appUpdateInfo: NSDictionary) {
        if (appUpdateInfo.count > 0) {
            DispatchQueue.main.sync {
                // FIXME: Changes for Cross platform issue solved
                // let bundle = Bundle(for: type(of: self))
                let bundleURL = Bundle(for: AppSyncService.self).url(forResource: "AppsOnAir-AppSync", withExtension: "bundle")
                let bundle = Bundle(url: bundleURL ?? URL(fileURLWithPath: ""))
                let storyboard = UIStoryboard(name: "AppUpdate", bundle: bundle)
                let modalVc = storyboard.instantiateViewController(withIdentifier: "MaintenanceViewController") as! MaintenanceViewController
                modalVc.updateDataDictionary = appUpdateInfo
                
                if let topController = UIApplication.topMostViewController(), !(topController is MaintenanceViewController) {
                    let navController = UINavigationController(rootViewController: modalVc)
                    navController.modalPresentationStyle = .overCurrentContext
                    let topController = UIApplication.topMostViewController()
                    topController?.present(navController, animated: true) {
                        // This code snippet is for fixing one UI accessability related bug for our other cross platform plugin
                        NotificationCenter.default.post(name: NSNotification.Name("visibilityChanges"), object: nil, userInfo: ["isPresented": true])
                    }
                }
            }
        }
    
    }
}
