Pod::Spec.new do |s|
  s.name             = 'AppsOnAir-AppSync'
  s.version          = '0.6.2'
  s.summary          = 'AppsOnAir AppSync'

  s.description      = 'Appsonair services for force update and maintenance for iOS mobile apps.'

  s.homepage         = 'https://documentation.appsonair.com/MobileQuickstart/AppSync/ios-sdk-setup'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'devtools-logicwind' => 'devtools@logicwind.com' }
  s.source           = { :git => 'https://github.com/apps-on-air/AppsOnAir-iOS-AppSync.git', :tag => s.version.to_s }

  s.swift_version  = '5.0'
  s.ios.deployment_target = '12.0'

    # Access the all the UI File within the pod  # for access SwiftUI  inside AppSync
  s.resource_bundles = {
    'AppsOnAir-AppSync' => ['AppsOnAir-AppSync/Assets/**/*']
  }

  s.source_files = 'AppsOnAir-AppSync/Classes/**/*'
  
  # AppsOnAir Core pod
  s.dependency 'AppsOnAir-Core', '0.0.5'
 
end
