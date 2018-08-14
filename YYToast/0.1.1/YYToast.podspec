#
# Be sure to run `pod lib lint YYToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYToast'
  s.version          = '0.1.1'
s.summary          = 'YYToast Is white on black box warning general'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: YYToast is in several app universal modules, which show white background black characters, pop up after a certain time and disappear, belonging to the warning box
                       DESC

  s.homepage         = 'https://git.ycosystem.com/iOSMode/YYToast'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sun.chuanjun' => 'sun.chuanjun@ycofoundation.com' }
  s.source           = { :git => 'https://git.ycosystem.com/iOSMode/YYToast.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YYToast/Classes/**/*'

  # s.resource_bundles = {
  #   'YYToast' => ['YYToast/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
