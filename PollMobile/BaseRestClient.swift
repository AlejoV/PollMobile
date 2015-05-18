//
//  BaseRestClient.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 29/04/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol RestClientProtocol{
  func processResponse(json:JSON)
  func processError(errorCode:Int?, errorDescription:String?)
}

class BaseRestClient{
  var delegate:RestClientProtocol?
  let baseURL = "http://192.168.1.5:8080/PollWeb/api/"
  
  init(){}
  
  func callRestService(method:Alamofire.Method, url:String, jsonParam:[String:AnyObject]?){
    
    Alamofire.request(method, baseURL+url, parameters: jsonParam, encoding: .JSON)
      .responseJSON { (request, response, data, error) in
        println("response: \(response)")
        if let statusCode = response?.statusCode {
          if statusCode >= 200 && statusCode < 300{
            let json = JSON(data!)
            println("JSON Account: \(json)")
            self.delegate?.processResponse(json)
          } else {
            println("error: \(response?.statusCode)")
            self.delegate?.processError(response?.statusCode, errorDescription: response?.description)
          }
        }
    }
  }
  
  
}
