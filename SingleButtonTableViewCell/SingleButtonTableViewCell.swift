//
//  SingleButtonTableViewCell.swift
//  PSAlertView
//
//  Created by Macmini5 on 30/08/16.
//  Copyright © 2016 Macmini5. All rights reserved.
//

import UIKit

public class SingleButtonTableViewCell: UITableViewCell {
    @IBOutlet public var btnAlertFirst: UIButton!

    override public func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
