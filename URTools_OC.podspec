Pod::Spec.new do |s|
  s.name         = "URTools_OC"
  s.version      = "1.0.2"
  s.summary      = "tools"
  s.homepage     = "http://192.168.1.253:3000/iOS/Tools"
  s.license      = "MIT"
  s.authors      = { 'urun' => 'urundata@gmail.com'}
  s.platform     = :ios, "8.0"
  s.source       = { :git => "http://192.168.1.253:3000/iOS/Tools.git", :tag => s.version }
  s.source_files = 'Tools', 'OC/Tools_OC/Helper/**/*.{h,m}'
  s.requires_arc = true
end