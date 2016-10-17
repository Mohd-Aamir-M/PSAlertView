#
# Be sure to run `pod lib lint PSAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PSAlertView'
  s.version          = '0.1.0'
  s.summary          = 'PSAlertView uses the properties and methods defined in this class to set the title, message, and delegate of PSAlertView and configure the buttons. You must set a delegate if you add custom buttons. The delegate should conform to the PSAlertViewdelegate protocol. Use the display() method to display PSAlertView after it is configured. Use the dismiss() method to dismiss PSAlertView.’

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

s.homepage     = 'https://github.com/PSIPhone/PSAlertView'
s.default_subspec = 'Core'

s.subspec 'Core' do | ss |
ss.source_files = ‘PSAlertView/**/*.{swift}’
ss.resource_bundle = {
‘PSAlertView’ => [
‘PSAlertView/Example/HeaderCell/CellHeader.swift’,
'PSAlertView/Example/HeaderCell/CellHeader.xib’,
'PSAlertView/Example/AlertView/PSAlertView.swift',
'PSAlertView/Example/AlertView/PSAlertView.xib’,
'PSAlertView/Example/TwoButtonTableViewCell/TwoButtonTableViewCell.swift’,
'PSAlertView/Example/TwoButtonTableViewCell/TwoButtonTableViewCell.xib’,
'PSAlertView/Example/SingleButtonTableViewCell/SingleButtonTableViewCell.swift’,
'PSAlertView/Example/SingleButtonTableViewCell/SingleButtonTableViewCell.swift’,
'PSAlertView/Example/ViewController.swift’,
'PSAlertView/Example/Main.storyboard’,
]
}
end

  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license      =  { :type => ‘GNU’ }
  s.authors = { 'Perception System' => 'aamir@perceptionsystem.com' }
s.source            =  { :git => 'https://github.com/PSIPhone/PSAlertView.git', :tag => 'v0.0.1’ }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
s.platform     = :ios, '8.0'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PSAlertView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PSAlertView' => ['PSAlertView/Assets/*.png']
  # }
s.requires_arc = true

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
end
