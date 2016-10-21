#
#  Be sure to run `pod spec lint PSAlertView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |spec|
spec.name         = 'PSAlertView'
spec.version      = '1.0'
spec.license      = { :type => 'MIT' }
spec.homepage     = 'https://github.com/PSIPhone/PSAlertView'
spec.authors      = { 'PSIphone' => 'iosdev1@perceptionsystem.com' }
spec.summary      = 'ARC and GCD Compatible Reachability Class for iOS and OS X.'
spec.source       = { :git => 'https://github.com/PSIPhone/PSAlertView.git', :tag => 'v1.0' }
spec.module_name  = 'PSAlertView'

spec.ios.deployment_target  = '10.0'

spec.source_files = "**/*.{swift}"


spec.resource_bundles = {
'PSAlertView' => ['**/**/**/*.{xib}']
}


spec.resources = "**/*.{xib}"



spec.ios.framework  = 'UIKit'

spec.requires_arc = true

end
