Pod::Spec.new do |s|
  s.name         = "URTools_Swift"
  s.summary      = "URTools in Swift"
  s.version      = "1.1.3"
  s.homepage     = "http://192.168.1.253:3000/iOS/Tools"
  s.license      = "MIT"
  s.authors      = { 'urun' => 'urundata@gmail.com'}
  s.source       = { :git => "http://192.168.1.253:3000/iOS/Tools.git", :tag => s.version }
  s.source_files = 'Swift/Tools/Helper/**/*.swift'
  s.requires_arc = true

  s.ios.deployment_target = '8.0'

  s.preserve_paths  = 'Swift/CommonCrypto/**/*'
  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]'         => '$(PODS_ROOT)/URTools_Swift/Swift/CommonCrypto/iphoneos',
    'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]'  => '$(PODS_ROOT)/URTools_Swift/Swift/CommonCrypto/iphonesimulator',
    'SWIFT_VERSION' => '4.0'
  }
end
