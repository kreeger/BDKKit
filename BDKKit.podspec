Pod::Spec.new do |s|
  s.name         = 'BDKKit'
  s.version      = '0.0.2'
  s.summary      = 'An abstraction full of categories and other helpers.'
  s.homepage     = 'https://github.com/kreeger/BDKKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE.markdown' }
  s.author       = { 'Ben Kreeger' => 'ben@kree.gr' }
  s.source       = { :git => 'https://github.com/kreeger/BDKKit.git', :tag => 'v0.0.2' }
  s.source_files = 'Classes/**/*.{h,m}'
  s.resources    = 'Resources/**'
  s.frameworks   = 'QuartzCore'
  s.requires_arc = true
end
