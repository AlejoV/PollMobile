//
//  MainTabBarViewController.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 12/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
  
  var user:Account?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    println("In MainTabBar \(user)")
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
