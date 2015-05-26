//
//  MainTableViewCell.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 18/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
  
  @IBOutlet weak var createdByLabel: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var pollDescription: UITextView!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
