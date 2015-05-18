//
//  AccountClient.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 29/04/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation

class AccountClient:BaseRestClient {
  
  func loginUser(username: String){
    println("URL: \(baseURL)accounts/\(username) ")
    callRestService(.POST, url: "accounts/"+username, jsonParam: nil);
  }
  
}