# PSAlertView
<<<<<<< HEAD

[![CI Status](http://img.shields.io/travis/MacMini03/PSAlertView.svg?style=flat)](https://travis-ci.org/MacMini03/PSAlertView)
[![Version](https://img.shields.io/cocoapods/v/PSAlertView.svg?style=flat)](http://cocoapods.org/pods/PSAlertView)
[![License](https://img.shields.io/cocoapods/l/PSAlertView.svg?style=flat)](http://cocoapods.org/pods/PSAlertView)
[![Platform](https://img.shields.io/cocoapods/p/PSAlertView.svg?style=flat)](http://cocoapods.org/pods/PSAlertView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PSAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PSAlertView"
```
Finally, just add 'TwoButtonTableViewCell.xib', 'SingleButtonTableViewCell.xib' & 'CellHeader.xib'  to Copy Bundle Resources.

##Intialize alertView/ActionSheet using 
    var  alertView : PSAlertView! = nil


##Creating the alert view
        alertView?.isAlert = true

        alertView = PSAlertView (title: "Alert" ,message: "Message") // intialze alertView
        alertView!.delegate = self
        alertView!.showCancelButton = true
        alertView?.tag = 2
              //upto 4 buttons
        alertView?.buttons = ["button1","button2","button3"]
        alertView?.tblViewAlertButton?.layer.cornerRadius = 12.0
        //cancel button title
        alertView?.cancelButtonTitle = "Dimiss"
        //set type of animation
        alertView?.objAnimationType = .alertCenterPop
        //display() method PSAlertViewDelegate
        alertView!.display()

##Creating the ActionSheet
        alertView = PSAlertView (title: "Actionsheet" ,message: "message") // intialze alertView
        alertView?.isAlert = false
        alertView!.delegate = self
        alertView!.showCancelButton = true
        //up to 4 buttons
        alertView?.buttons =  ["button1","button2","button3","button4"]
        alertView?.tblViewLeadingConstraints.constant = 0
        alertView?.tag = 2
         //cancel button title
        alertView?.cancelButtonTitle = "Cancel"
         //set type of animation
        alertView?.objAnimationType = .sheetElasticIn
        //display() method PSAlertViewDelegate
        alertView! .display()

##Set delegate method of PSAlertViewdelegate 
public func didTapButton(_ alertView: PSAlertView, atIndex: NSInteger) {
        print("button index",atIndex)
    }



##Following are the animation types:
1. alertCenterPop //For AlertView
    
2. alertCenterFade //For AlertView

3. alertCenterPopOut //For AlertView

4. sheetElasticIn //For ActionSheet

5. sheetSimpleIn //For ActionSheet
    


## Author

MacMini03, iosdev1@perceptionsystem.com

## License

PSAlertView is available under the MIT license. See the LICENSE file for more info.
=======
PSAlertView uses the properties and methods defined in this class to set the title, message, and delegate of PSAlertView and configure the buttons. You must set a delegate if you add custom buttons.
>>>>>>> ae435c9f42e82e851570495bea49ebec54dad700
