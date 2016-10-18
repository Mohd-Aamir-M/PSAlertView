//
//  PSAlertView.swift
//  PSAlertView
//
//  Created by Macmini5 on 30/08/16.
//  Copyright © 2016 Macmini5. All rights reserved.
//
public enum AnimationType {
    case alertCenterPop // for alertView
    case alertCenterFade // for alertView
    case alertCenterPopOut // for alertView
    case sheetElasticIn // for actionSheet
    case sheetSimpleIn // for actionSheet
}

import UIKit

public @objc protocol PSAlertViewdelegate {
    @objc optional
   public func didTapButton(_ alertView: PSAlertView, atIndex:NSInteger)
    
}

public class PSAlertView: UIView ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet public var tblViewAlertButton: UITableView!
    @IBOutlet public var tblViewHeightConstraints: NSLayoutConstraint! // heightConstraint
    @IBOutlet public var tblViewLeadingConstraints: NSLayoutConstraint! // Leading constraint for actionsheet
    @IBOutlet public var tblViewTopConstraint : NSLayoutConstraint! // top constraint for actionsheet
    
    
    // Property for showing cancel button in alertView. This is public property
    public var showCancelButton : Bool?;
    
    // property for showing Alertview or ActionSheet using true or false
    public var isAlert : Bool = true
    
  public  var strTitle: String?
   public var strMessage : String?

    // Property for title of cancel button. This is public property
   public var  cancelButtonTitle : String?;
    
    // enum initialze of animation type
   public var objAnimationType : AnimationType = AnimationType.alertCenterPopOut
    

    // property for assign number of button to alertView.This is public property
  public  var buttons : NSMutableArray!

    // it is the delegate property for the alertView delegate.This is public property
  public  var delegate:PSAlertViewdelegate!
    
    
   public override init (frame : CGRect) {
        super.init(frame : frame)
    }
    
   public convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    // add cancel button
   public func addCancelButton (_ btnCancel : UIButton){
        btnCancel.setTitle(cancelButtonTitle, for: UIControlState())
        btnCancel.addTarget(self, action: #selector(PSAlertView.clickCancel(_:)), for: .touchUpInside)
        btnCancel.tag = 0
    }
    
    
  public  convenience  init(title : String, message : String) {
        self.init(frame: UIScreen.main.bounds)
        strTitle = title
        strMessage = message
        
        if strTitle == nil {
            strTitle = title
        } else  {
            strTitle = title
        }
        
        if strMessage == nil {
            strMessage = message
        } else {
            strMessage = message
        }
        loadViewFromNib()
        
        //Register nib of tableview headerView
        tblViewAlertButton.register(UINib(nibName: "CellHeader", bundle: nil), forCellReuseIdentifier: "CellHeader")
        tblViewAlertButton.dataSource = self
        tblViewAlertButton.delegate = self

        tblViewAlertButton.backgroundColor = UIColor.red
        
        // height of tableview row
        tblViewAlertButton.estimatedRowHeight = 44;
        tblViewAlertButton.rowHeight = UITableViewAutomaticDimension;
        
        // height of tableview header
        tblViewAlertButton.sectionHeaderHeight = UITableViewAutomaticDimension;
        tblViewAlertButton.estimatedSectionHeaderHeight = 65;
    
        tblViewAlertButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        tblViewAlertButton.layer.shadowColor = UIColor.black.cgColor
        tblViewAlertButton.layer.shadowRadius = 1.0;
        tblViewAlertButton.layer.shadowOpacity = 0.5

        buttons = NSMutableArray() //initialize button array
        if isAlert {
            tblViewTopConstraint.constant = 0
            tblViewLeadingConstraints.constant = 20
        } else {
            tblViewLeadingConstraints.constant = 0

        }
    }

   public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // add PSAlertView/PSActionSheet
   public func loadViewFromNib(){
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PSAlertView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! PSAlertView
        view.frame = bounds
        self .addSubview(view)
    }
    
   public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
   public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerViewCell = tableView.dequeueReusableCell(withIdentifier: "CellHeader") as! CellHeader
        if isAlert {
            headerViewCell.backgroundColor = UIColor.white
            headerViewCell.lblTitle.text = strTitle
            headerViewCell.lblMessage.text = strMessage
            return headerViewCell
        } else {
            headerViewCell.backgroundColor = UIColor.white
            headerViewCell.lblTitle.text = strTitle
            headerViewCell.lblMessage.text = strMessage
            return headerViewCell
        }
    }
    
   public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
//    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return UITableViewAutomaticDimension
//    }
    
   public func tableView(_ tableView : UITableView , estimatedHeightForRowAt indexPath : IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
  public  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if (buttons.count)>1 && showCancelButton! {
            return buttons.count + 1;
            
        }
        else if (buttons.count>0){
            return buttons.count;
        }
        else{
            return 1;
        }
    }
    
  public  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if buttons.count==1 && showCancelButton!{
            let identifier = "firstCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TwoButtonTableViewCell!
            if cell == nil {
                tableView.register(UINib(nibName: "TwoButtonTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TwoButtonTableViewCell
            }
            self .addCancelButton((cell?.btnAlertFirst)!);
            cell?.btnSecondAlert .setTitle(buttons[0] as? String, for: UIControlState())
            cell?.btnSecondAlert.addTarget(self, action: #selector(PSAlertView.clickOnOtherButton(_:)), for: .touchUpInside)
            return cell!;
        } else {
            let identifier = "secondCell"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! SingleButtonTableViewCell!

            if cell == nil {
                tableView.register(UINib(nibName: "SingleButtonTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SingleButtonTableViewCell
            }

            if ((buttons.count)==0 || buttons == nil) && showCancelButton! {
                
                self .addCancelButton((cell?.btnAlertFirst)!);
            }  else{
                if (indexPath as NSIndexPath).row == (buttons.count) {
                self .addCancelButton((cell?.btnAlertFirst)!);

                }
                else{
                    cell?.btnAlertFirst .setTitle(buttons[(indexPath as NSIndexPath).row] as? String, for: UIControlState())
                    cell?.btnAlertFirst.addTarget(self, action: #selector(PSAlertView.clickOnOtherButton(_:)), for: .touchUpInside)
                }
            }
            
            return cell!;
        }
    }
 
    
    // display alertView/ActionSheet using animaiton
  public  func display() {
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        
        if isAlert {
                switch(objAnimationType) {
                case .alertCenterFade:
                    setAnimation(true, .alertCenterFade)
                    break;
                case .alertCenterPopOut:
                    setAnimation(true, .alertCenterPopOut)
                    break;
                case .alertCenterPop:
                    setAnimation(true, .alertCenterPop)
                    break;
                default : break
            }
        } else {
            switch(objAnimationType) {
            case .sheetElasticIn:
                setAnimation(true, .sheetElasticIn)
                break
            case .sheetSimpleIn :
                setAnimation(true, .sheetSimpleIn)

            default : break
            }
        }
    }
    
    // programmatically set top(y) position of tableview
    public func addConstraintsOnAnimation() {
        self.tblViewTopConstraint.constant = ((self.frame.size.height)-(self.tblViewAlertButton.frame.size.height))/2;
        tblViewLeadingConstraints.constant = 0
        self.tblViewAlertButton.layoutIfNeeded()
    }

    
    // dismiss alertView/actionsheet
   public func dismiss() {
        switch(objAnimationType) {
        case .alertCenterFade:
            setAnimation(false, .alertCenterFade)
            break;
        case .alertCenterPopOut:
            setAnimation(false, .alertCenterPopOut)
            break;
        case .alertCenterPop:
            setAnimation(false, .alertCenterPop)
            break;
        case .sheetElasticIn:
            setAnimation(false, .sheetElasticIn)
            break;
        case .sheetSimpleIn :
            setAnimation(false, .sheetSimpleIn)
            break;
        }
    }
    
    // Perform animation using this method it takes two parameters like if isAnimation is true then it will display alert/actionSheet with the type of animation.
  public  func setAnimation(_ isAnimation : Bool, _ animationType: AnimationType) {

        switch(objAnimationType) {
            
        //Animation for AlertView alertCenterPop
        case .alertCenterPop :
            UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 8.0, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
                if (isAnimation == true) {
                    self.alpha = 0.0
                    self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 0.3, y: 0.3);
                } else {
                    self.tblViewAlertButton.alpha = 0.0
                    self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 0.3, y: 0.3);
                }
                }, completion: {
                    (finished: Bool) -> Void in
                    
                    let window = UIApplication.shared.windows[0]
                    
                    //Once the label is completely invisible, set the text and fade it back in
                    self.tblViewAlertButton.reloadData()
                    self.tblViewAlertButton.layoutIfNeeded()
                    
                    self.tblViewHeightConstraints.constant = (self.tblViewAlertButton.contentSize.height)
                    window.rootViewController?.view.addSubview(self)
                    // Fade in
                    UIView.animate(withDuration: 0.30, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                        if (isAnimation == true) {
                            self.alpha = 1.0
                            self.tblViewAlertButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        } else {
                            self.alpha = 0.0
                            self.tblViewAlertButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
                        }
                        }, completion: nil)
            })

        //Animation for AlertView alertCenterFade
        case .alertCenterFade :
            if (isAnimation == true) {
                
                self.tblViewAlertButton.fadeIn(0.25, delay: 0.0, completion: { (finished) in
                    self.alpha = 0.0
                    let window = UIApplication.shared.windows[0]
                    //
                    //Once the label is completely invisible, set the text and fade it back in
                    self.tblViewAlertButton.reloadData()
                    self.tblViewAlertButton.layoutIfNeeded()
                    //
                    self.tblViewHeightConstraints.constant = (self.tblViewAlertButton.contentSize.height)
                    window.rootViewController?.view.addSubview(self)
                    UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                        self.alpha = 1.0
                        }, completion: nil)
                    
                })
            } else {
                self.tblViewAlertButton.fadeOut(0.4, delay: 0.0, completion: { (finished) in
                    self.alpha = 0.0
                    self.removeFromSuperview()
                    
                })
            }
            
        //Animation for AlertView centerPopOut
        case .alertCenterPopOut:
            if (isAnimation == true) {
                
                self.layer.shouldRasterize = true
                self.layer.rasterizationScale = UIScreen.main.scale
                let window = UIApplication.shared.windows[0]
                
                //Once the label is completely invisible, set the text and fade it back in
                self.tblViewAlertButton.reloadData()
                self.tblViewAlertButton.layoutIfNeeded()
                
                self.tblViewHeightConstraints.constant = (self.tblViewAlertButton.contentSize.height)
                window.rootViewController?.view.addSubview(self)
                self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 0.20, y: 0.20);
            }
            UIView.animate(withDuration: 0.20, animations: {
                if (isAnimation == true) {
                    self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1);
                } else {
                    self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95);
                }
                })
            { (finished) in
                UIView.animate(withDuration: 0.20, animations: {
                    if (isAnimation == true) {
                        self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95);
                    } else {
                        self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1);
                    }
                    }, completion: { (finished) in
                        UIView.animate(withDuration: 0.20, animations: {
                            if (isAnimation == true) {
                                
                                self.tblViewAlertButton.transform = CGAffineTransform.identity;
                            } else {
                                self.alpha=0;
                                self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 0.40, y: 0.40);
                            }
                            }, completion: { (finished) in
                                
                        })
                })
            }
            
            //Animation for ActionSheet elasticIn
            case .sheetElasticIn:
                UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 1.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                    if (isAnimation == true) {
                        self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1.08);
                        //
                        self.perform(#selector(self.addConstraintsOnAnimation), with: self, afterDelay: 0.1)
                        self.tblViewAlertButton.frame = CGRect(x:0,y: UIScreen.main.bounds.height - 20 , width : self.frame.size.width,height: ((self.tblViewAlertButton.frame.height) + 50.0))
                        
                    }else{
                        self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1.08);
                    }
                    }, completion: { (finished) in
                
                UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    if isAnimation == true {
                        self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1.08);

                        self.alpha = 1

                    } else {
                        self.alpha = 0
                        UIView.animate(withDuration: 0.20, animations: { 
                            self.tblViewAlertButton.frame = CGRect(x:0,y: self.frame.size.height+(self.tblViewAlertButton.frame.size.height), width : self.frame.size.width,height: (self.tblViewAlertButton.frame.height))

                        })

                    }
                    }, completion: { (finished) in
                        let window = UIApplication.shared.windows[0]

                        
                        self.tblViewAlertButton.reloadData()
                        self.tblViewAlertButton.layoutIfNeeded()
                        
                        self.tblViewHeightConstraints.constant = (self.tblViewAlertButton.contentSize.height)
                        window.rootViewController?.view.addSubview(self)

                            if isAnimation == true {
                                UIView.animate(withDuration: 0.40, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                                    self.tblViewAlertButton.frame = CGRect(x:0,y: UIScreen.main.bounds.height - 20 , width : self.frame.size.width,height: (self.tblViewAlertButton.frame.height))
                                    let y = ((self.frame.size.height)-(self.tblViewAlertButton.frame.size.height))/2;
                                    
                                    self.tblViewTopConstraint.constant = y

                                    }, completion: { (finished) in
                                        
                                })
                                
                            } else {
                                UIView.animate(withDuration: 0.3, animations: {

                                self.tblViewAlertButton.frame = CGRect(x:0,y: self.frame.size.height+(self.tblViewAlertButton.frame.size.height), width : self.frame.size.width,height: (self.tblViewAlertButton.frame.height))
                                
                                self.tblViewTopConstraint.constant = ((self.frame.size.height)+(self.tblViewAlertButton.frame.size.height));
                                self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 0.20, y: 1.8);
                                self.tblViewAlertButton.removeFromSuperview()
                                self.removeFromSuperview()
                                
                            })

                        }
                        })
                })

                break
            
            //Animation for ActionSheet simpleIn
        case .sheetSimpleIn :
            
            UIView.animate(withDuration: 0.15, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                if isAnimation == true {
                    self.alpha = 1.0
                    self.tblViewAlertButton.transform =  CGAffineTransform.identity
                    self.tblViewTopConstraint.constant = ((self.frame.size.height)+(self.tblViewAlertButton.frame.size.height));
                    
                    self.tblViewAlertButton.frame = CGRect(x:0,y: UIScreen.main.bounds.height + 100, width : self.frame.size.width,height: (self.tblViewAlertButton.frame.height))
                    
                    self.perform(#selector(self.addConstraintsOnAnimation), with: self, afterDelay: 0.1)
                    
                } else {
                    self.alpha = 0.0
                    
                    self.tblViewAlertButton.frame = CGRect(x:0,y: self.frame.size.height+(self.tblViewAlertButton.frame.size.height), width : self.frame.size.width,height: (self.tblViewAlertButton.frame.height))
                }
                }, completion: {
                    (finished: Bool) -> Void in
                    let window = UIApplication.shared.windows[0]
                    
                    self.tblViewAlertButton.reloadData()
                    self.tblViewAlertButton.layoutIfNeeded()
                    
                    self.tblViewHeightConstraints.constant = (self.tblViewAlertButton.contentSize.height)
                    window.rootViewController?.view.addSubview(self)
                    
                    UIView.animate(withDuration: 0.15, animations: {
                        if isAnimation == true {
                            self.tblViewAlertButton.transform = CGAffineTransform.identity;
                            self.tblViewAlertButton.frame = CGRect(x:0,y: UIScreen.main.bounds.height + 100, width : self.frame.size.width,height: (self.tblViewAlertButton.frame.height))
                            
                        } else {
                            self.tblViewAlertButton.transform = CGAffineTransform.identity.scaledBy(x: 0.20, y: 0.20);
                            self.tblViewAlertButton.removeFromSuperview()
                            self.removeFromSuperview()
                            
                        }
                    })
            })
            
            break
        }
        }

    
   public func clickOnOtherButton(_ sender : UIButton) -> Void {
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tblViewAlertButton!.indexPath(for: cell)
        let senderIndex : NSInteger =  (showCancelButton! == false) ? ((indexPath as NSIndexPath?)?.row)! : ((indexPath as NSIndexPath?)?.row)!+1
        delegate.didTapButton!(self, atIndex:senderIndex)
        
//        self.dismiss()
    }
    
public func clickCancel(_ sender : UIButton) -> Void {
        delegate.didTapButton!(self, atIndex: sender.tag)
        self.dismiss()
        
    }
    
}

public extension UIView {
   public func fadeIn(_ duration: TimeInterval, delay: TimeInterval, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)  }
    
  public  func fadeOut(_ duration: TimeInterval , delay: TimeInterval, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
}
