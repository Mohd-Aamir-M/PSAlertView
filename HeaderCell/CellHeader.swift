//
//  Cell_QuestionEvent.swift
//  HP
//
//  Created by MacMini03 on 17/08/16.
//  Copyright © 2016 Mac18. All rights reserved.
//

import UIKit

class CellHeader: UITableViewCell {
    @IBOutlet var lblTitle : UILabel! // title label
    @IBOutlet var lblMessage : UILabel! // message label

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

