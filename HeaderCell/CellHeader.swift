//
//  Cell_QuestionEvent.swift
//  HP
//
//  Created by MacMini03 on 17/08/16.
//  Copyright © 2016 Mac18. All rights reserved.
//

import UIKit

public class CellHeader: UITableViewCell {
   public @IBOutlet var lblTitle : UILabel! // title label
  public  @IBOutlet var lblMessage : UILabel! // message label

   public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

