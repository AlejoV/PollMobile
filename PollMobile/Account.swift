//
//  Account.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 3/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation
import SwiftyJSON

class Account:BaseEntity{
  
  let username:String!
  let id:Int!
  
  override init(json: JSON?) {
    self.username = json?["username"].stringValue
    self.id = json?["accountId"].int
    super.init(json: json)
  }
  
  
}