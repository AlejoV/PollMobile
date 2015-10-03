//
//  PollCategory.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 14/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation
import SwiftyJSON

class PollCategory:BaseEntity{
  let categoryId:NSNumber!
  let description:String?
  
  override init(json: JSON?) {
    self.description = json?["description"].stringValue
    self.categoryId = json?["categoryId"].int
    super.init(json: json)
  }
}