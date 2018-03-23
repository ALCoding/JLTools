Pod::Spec.new do |s|
  s.name         = "JLTools_Swift"
  s.summary      = "JLTools in Swift"
  s.version      = "0.0.1"
  s.homepage     = "https://github.com/ALCoding/JLTools"
  s.license      = "MIT"
  s.authors      = { 'Jalen' => 'alvdev@126.com'}
  s.source       = { :git => "https://github.com/ALCoding/JLTools.git", :tag => s.version }
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
