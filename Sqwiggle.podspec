#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "Sqwiggle"
  s.version      = "0.0.1"
  s.summary      = "A short description of Sqwiggle."
  s.homepage     = "http://www.sqwiggle.com"
  s.license      = 'MIT'
  s.author       = { "Cameron Webb" => "cameron@sqwiggle.com" }
  s.source       = { :git => "git@github.com:sqwiggle/sqwiggle-ios-sdk.git", :tag => s.version.to_s }

  s.ios.deployment_target = '6.0'
  s.requires_arc = true
  s.public_header_files = "iOSSDK/*.h"
  s.source_files = "iOSSDK/*.{h,m}"

  s.dependency 'AFNetworking', "~> 2.0.3"
  s.dependency "ObjectiveSugar", '~> 0.9'

end
