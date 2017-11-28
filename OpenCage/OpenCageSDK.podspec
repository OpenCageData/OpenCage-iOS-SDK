#
# Be sure to run `pod lib lint OpenCageSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OpenCageSDK'
  s.version          = '0.0.1'
  s.summary          = 'OpenCageSDK is the SDK for Open Cage Geocoding API'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This is written to help the users of the OpenCage API system for Geocoding within iOS'

  s.homepage         = 'https://geocoder.opencagedata.com/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'OpenCage' => 'edf@opencagedata.com' }
  s.source           = { :git => 'https://github.com/OpenCageData/OpenCage-iOS-SDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'OpenCageSDK/Classes/*'
  
  # s.resource_bundles = {
  #   'OpenCageSDK' => ['OpenCageSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
