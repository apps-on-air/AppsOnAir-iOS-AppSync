struct EnvironmentConfig{
// MARK: - Production Config:
   static let serverBaseURL = "https://server.appsonair.com/"
   static let cdnBaseURL = "https://cdn.appsonair.com/"
    
// MARK: - API Endpoints:
    static let appSyncInfo = serverBaseURL + "v1/app-services/"
    static let cdnAppSyncInfo = cdnBaseURL + "app-details/"
}
