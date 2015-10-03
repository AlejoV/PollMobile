//
//  PollAccessoryView.swift
//  PollMobile
//
//  Created by Alejandro Valencia on 2/06/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import UIKit

protocol PollAccessoryDelegate{
    func donePressed()
}


class PollAccessoryView: UIView {
    
    var delegate:PollAccessoryDelegate?

    @IBAction func doneAction() {
        self.delegate?.donePressed()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
