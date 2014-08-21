Pod::Spec.new do |s|
  version = "0.1"
  s.name         = "RCKit"
  s.version      = version
  s.summary	 = "A collection of Objc categories."
  s.homepage     = "https://github.com/ridgecorn/RCKit"
  s.author       = { "Looping" => "www.looping@gmail.com" }
  s.source       = { :git => "https://github.com/ridgecorn/RCKit.git", :tag => version }
  s.platform     = :ios, '6.0'
  s.source_files = 'Classes/**/*.{h,m}'
  s.requires_arc = true
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  
  s.dependency 'Reachability'

end
