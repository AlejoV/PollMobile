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
  typealias T
  var responseEntity:ResponseEntity<T>?{get set}
  func processResponse(json:JSON)->ResponseEntity<T>!
}

class BaseRestClient<U:RestClientProtocol>{
  typealias Delegate = U
  var delegate:Delegate?
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
            //println(request)
            self.delegate?.responseEntity = self.delegate?.processResponse(json)
          } else {
            println("error: \(response?.statusCode)")
            var errorResponse = ResponseEntity<AnyObject>()
            errorResponse.success = false
            errorResponse.errorCode = response?.statusCode
            errorResponse.error = response?.description
            self.delegate?.responseEntity = ResponseEntity()
          }
        }
    }
  }
  
  
}
