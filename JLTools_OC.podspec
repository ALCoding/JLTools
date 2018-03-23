Pod::Spec.new do |s|
  s.name         = "JLTools_OC"
  s.version      = "0.0.1"
  s.summary      = "tools"
  s.homepage     = "https://github.com/ALCoding/JLTools"
  s.license      = "MIT"
  s.authors      = { 'Jalen' => 'alvdev@126.com'}
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ALCoding/JLTools.git", :tag => s.version }
  s.source_files = 'Tools', 'OC/Tools_OC/Helper/**/*.{h,m}'
  s.requires_arc = true
end