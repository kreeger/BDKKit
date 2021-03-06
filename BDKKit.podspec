Pod::Spec.new do |s|
  s.name         = 'BDKKit'
  s.version      = '0.0.6'
  s.summary      = 'An abstraction full of categories and other helpers.'
  s.homepage     = 'https://github.com/kreeger/BDKKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE.markdown' }
  s.author       = { 'Ben Kreeger' => 'ben@kree.gr' }
  s.source       = { :git => 'https://github.com/kreeger/BDKKit.git', :tag => "v#{s.version}" }
  s.source_files = 'Classes/**/*.{h,m}'
  s.resources    = 'Resources/**'
  s.frameworks   = 'UIKit', 'Foundation', 'QuartzCore'
  s.requires_arc = true
end
