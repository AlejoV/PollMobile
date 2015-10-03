//
//  PollClient.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 14/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PollClient: BaseRestClient{
    
    let pollBaseURL:String = "polls"
    
    func getAllPolls(){
        println("URL: \(baseURL)\(pollBaseURL)")
        callRestService(.GET, url: "\(pollBaseURL)", jsonParam: nil)
    }
    
    func createPoll(poll:Poll){
        println("URL: \(baseURL)\(pollBaseURL)")
        println("VALID? \(NSJSONSerialization.isValidJSONObject(poll.entityToJSON()))")
        var jsonObj = JSON(poll.entityToJSON())
        println(jsonObj)
        callRestService(.POST, url: "\(pollBaseURL)", jsonParam: poll.entityToJSON())
    }
    
}