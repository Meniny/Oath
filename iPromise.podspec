Pod::Spec.new do |s|
  s.name             = 'iPromise'
  s.version          = "1.0.0"
  s.summary          = "Promise / Future concept implementation for Swift developing."
  s.homepage         = "https://github.com/Meniny/iPromise"
  s.license          = { :type => "MIT", :file => "LICENSE.md" }
  s.author           = 'Elias Abel'
  s.source           = { :git => "https://github.com/Meniny/iPromise.git", :tag => s.version.to_s }

  s.ios.deployment_target  = '8.0'
  s.osx.deployment_target  = '10.10'
  s.tvos.deployment_target = '9.0'

  s.social_media_url = 'https://meniny.cn/'
  s.source_files     = "iPromise/*.swift"
  s.requires_arc     = true
  s.description      = "Promise / Future concept implementation for Swift developing makes async code readable by a human being"
  s.module_name      = 'iPromise'
end
