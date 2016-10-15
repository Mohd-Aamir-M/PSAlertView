#
#  Be sure to run `pod spec lint PSAlertView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "PSAlertView"
  s.version      = "0.0.1"
  s.summary      = "PSAlertView uses the properties and methods defined in this class to set the title, message, and delegate of PSAlertView and configure the buttons. You must set a delegate if you add custom buttons. The delegate should conform to the PSAlertViewdelegate protocol. Use the display() method to display PSAlertView after it is configured. Use the dismiss() method to dismiss PSAlertView.”

  s.homepage     = 'https://github.com/PSIPhone/PSAlertView'


  s.license      =  { :type => ‘GNU’ }

  s.description      = <<-DESC
                       An optional longer description of MMSync

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC


  s.authors = { 'Perception System' => 'aamir@perceptionsystem.com' }
  s.platform     = :ios, “8.0”
  s.ios.deployment_target  = “8.0”
  s.osx.deployment_target = “10.0”


  s.source            =  { :git => 'https://github.com/PSIPhone/PSAlertView.git', :tag => 'v0.0.1’ }


  # s.source_files  = “PSAlertview”, “PSAlertView/**/*.{h,m,swift}”
  # s.exclude_files = “PSAlertView/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  s.framework  = 'UIKit'

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

end
