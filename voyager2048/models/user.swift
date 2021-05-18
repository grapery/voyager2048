//
//  user.swift
//  voyager2048
//
//  Created by grapestree on 2021/5/17.
//

import Foundation

class User: NSObject{
    var id: String
    var password: String
    var email: String
    var phone: String
    
    init(id: String,password: String,email: String,phone: String){
        self.id = id
        self.password = password
        self.email = email
        self.phone = phone
    }
}

class UserSetting:NSObject{
    
}
