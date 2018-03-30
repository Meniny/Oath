Pod::Spec.new do |s|
  s.name             = 'Oath'
  s.module_name      = 'Oath'
  s.author           = 'Elias Abel'
  s.version          = "1.0.1"
  s.summary          = "Promise / Future concept implementation for Swift developing."
  s.description      = "Promise / Future concept implementation for Swift developing makes async code readable by a human being."
  s.license          = { :type => "MIT", :file => "LICENSE.md" }
  s.source           = { :git => "https://github.com/Meniny/Oath.git", :tag => s.version.to_s }
  s.homepage         = "https://github.com/Meniny/Oath"
  s.social_media_url = 'https://meniny.cn/'

  s.ios.deployment_target  = '8.0'
  s.osx.deployment_target  = '10.10'
  s.tvos.deployment_target = '9.0'

  s.swift_version    = '4.1'
  s.requires_arc     = true
  s.source_files     = "Oath/*.swift"
end
