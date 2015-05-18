//
//  Poll.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 14/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation
import SwiftyJSON

class Poll:BaseEntity{
  
  let pollId:Int!
  let end:NSDate?
  let start:NSDate?
  let status:String?
  let owner:Account!
  let title:String?
  let category:PollCategory?
  let created:NSDate?
  let data:String?
  let description:String?

  override init(json: JSON?) {
    self.pollId = json?["pollId"].int
    if let seconds = json?["end"].doubleValue{
      println("seconds end \(seconds)")
      self.end = NSDate(timeIntervalSince1970: seconds/1000)
    } else {
      self.end = nil
    }
    if let seconds = json?["start"].doubleValue{
      println("seconds start \(seconds)")
      self.start = NSDate(timeIntervalSince1970: seconds/1000)
    } else {
      self.start = nil
    }
    if let seconds = json?["created"].doubleValue{
      println("seconds created \(seconds)")
      self.created = NSDate(timeIntervalSince1970: seconds/1000)
    } else {
      self.created = nil
    }
    self.status = json?["status"].stringValue
    self.owner = Account(json: json?["owner"])
    self.title = json?["title"].stringValue
    self.category = PollCategory(json: json?["categoryId"])
    self.data = json?["data"].stringValue
    self.description = json?["description"].stringValue
    
    super.init(json: json)
  }
  
}
