//
//  BaseEntity.swift
//  PollMobile
//
//  Created by Alejandro Valencia I on 3/05/2015.
//  Copyright (c) 2015 com.asoft. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONEntity {
    func entityToJSON()->[String:AnyObject]
}

class BaseEntity{
    
    init (json:JSON?){
        
    }
    
    init (){
        
    }
    
}