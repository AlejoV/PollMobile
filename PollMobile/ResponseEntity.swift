//
//  ResponseEntity.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 29/04/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation

class ResponseEntity<T>{
  
  init() {}
  
  var success:Bool?
  var error:String?
  var errorCode:Int?
  var entity:T?
  
}