#
# Be sure to run `pod lib lint OverlapStack.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OverlapStack'
  s.version          = '1.0.0'
  s.summary          = 'OverlapStack is a SwiftUI library that simplifies creating overlapping layouts.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
OverlapStack is a SwiftUI library that simplifies creating overlapping layouts. With OverlapHStack and OverlapVStack, you can arrange content in customizable horizontal or vertical overlapping stacks with full control over alignment, arrangement, and spacing.
                       DESC

  s.homepage         = 'https://github.com/hainayanda/OverlapStack'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hainayanda' => 'hainayanda@outlook.com' }
  s.source           = { :git => 'https://github.com/hainayanda/OverlapStack.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = "16.0"
  s.osx.deployment_target = "13.0"
  s.tvos.deployment_target = '16.0'
  s.watchos.deployment_target = '9.0'
  s.swift_versions = '5.5'

  s.source_files = 'OverlapStack/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OverlapStack' => ['OverlapStack/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
