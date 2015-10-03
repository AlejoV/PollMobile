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
    
    var pollId:Int?
    var end:NSDate?
    var start:NSDate?
    var status:String?
    var owner:Account?
    var title:String?
    var category:PollCategory?
    var created:NSDate?
    var data:String?
    var description:String?
    
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
    
    override init() {
        super.init()
    }
    
    func entityToJSON()->[String:AnyObject]{
        var dicJSON = [String: AnyObject]()
        if let tmp = self.pollId{
            dicJSON["pollId"] = tmp
        }
        if let tmp = self.end {
            dicJSON["end"] = tmp
        }
        if let tmp = self.start {
            dicJSON["start"] = tmp
        }
        if let tmp = self.status {
            dicJSON["status"] = tmp
        }
        if let tmp = self.owner {
            var ownerdict = ["accountId":tmp.id, "username":tmp.username] as NSDictionary
            dicJSON["owner"] =  ownerdict
        }
        if let tmp = self.title {
            dicJSON["title"] = tmp
        }
        if let tmp = self.category {
            dicJSON["categoryId"] = ["categoryId":tmp.categoryId, "description":tmp.description!] as NSDictionary
        }
        if let tmp = self.created {
            dicJSON["created"] = tmp
        }
        if let tmp = self.data {
            dicJSON["data"] = tmp
        }
        if let tmp = self.description {
            dicJSON["description"] = tmp
        }
        return dicJSON
    }
    
}
