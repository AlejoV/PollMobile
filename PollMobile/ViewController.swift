//
//  ViewController.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 28/04/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, RestClientProtocol {

  typealias T = Account
  var responseEntity:ResponseEntity<Account>?
  
  @IBOutlet weak var username: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBOutlet weak var loginUser: UIButton!
  
  
  @IBAction func loginUser(sender: UIButton) {
    println("USERNAME: \(username.text)")
    if username.text == ""{
      let alertController = UIAlertController(title: "Empty username", message:
        "Username can't be empty", preferredStyle: UIAlertControllerStyle.Alert)
      alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
      
      self.presentViewController(alertController, animated: true, completion: nil)
      return
    }
    
    var accountClient:AccountClient<ViewController> = AccountClient()
    accountClient.delegate = self
    accountClient.loginUser(username.text)
  }
  
  func processResponse(json:JSON) -> ResponseEntity<Account>! {
    println("In delegate \(json)")
    return nil
  }


}

