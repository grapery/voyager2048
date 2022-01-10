//
//  userModel.swift
//  voyager2048
//
//  Created by YananSuo on 2021/5/18.
//

import Foundation

struct UserModel: Hashable, Codable, Identifiable {
    var id: String
    var thumbnail: String
    var title: String
    var description: String
    var email: String
}

struct SessionUserDetails {
    let email: String
}
