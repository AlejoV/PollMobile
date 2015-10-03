//
//  CreateQuestionViewController.swift
//  PollMobile
//
//  Created by Alejandro Valencia on 5/06/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {

    @IBOutlet weak var questionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        println("Start Editing...")
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        textView.resignFirstResponder()
    }
    
}
