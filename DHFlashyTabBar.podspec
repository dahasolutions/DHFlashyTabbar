Pod::Spec.new do |s|
  s.name             = 'DHFlashyTabBar'
  s.version          = '5.0.0'
  s.summary          = 'One another nice animated tabbar'
  s.homepage         = 'https://github.com/dahasolutions/DHFlashyTabbar'
  s.license          = 'MIT'
  s.author           = { 'DHs' =>  'dahasolutions@gmail.com' }
  s.source           = { :git => 'https://github.com/dahasolutions/DHFlashyTabbar.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'DHFlashyTabBar/Classes/**/*'
end

