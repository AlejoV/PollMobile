//
//  Account.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 3/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation
import SwiftyJSON

class Account:BaseEntity, JSONEntity{
    
    let username:String!
    let id:NSNumber!
    
    override init(json: JSON?) {
        self.username = json?["username"].stringValue
        self.id = json?["accountId"].int
        super.init(json: json)
    }
    
    func entityToJSON()->[String:AnyObject]{
        var dicJSON = [String: AnyObject]()
        dicJSON["username"] = self.username
        dicJSON["id"] = self.id
        return dicJSON
    }
    
    
}