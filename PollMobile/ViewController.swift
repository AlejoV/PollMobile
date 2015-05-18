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

  @IBOutlet weak var username: UITextField!
  
  var user:Account = Account(json: nil)
  var performSegue:Bool = false
  
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
    
    var accountClient:AccountClient = AccountClient()
    accountClient.delegate = self
    accountClient.loginUser(username.text)
  }
  
  func processResponse(json:JSON){
    println("In delegate processResponse \(json)")
    user = Account(json: json)
    performSegue = true
    self.performSegueWithIdentifier("showMainController", sender: self)
    
  }
  
  func processError(errorCode: Int?, errorDescription: String?) {
    println("In delegate processError \(errorDescription)")
  }
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    println("In prepareForSegue")
    var dest:MainTabBarViewController = segue.destinationViewController as! MainTabBarViewController
    dest.user = self.user
    
  }
  
  override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool{
    println("In should perform")
    return performSegue
  }


}

