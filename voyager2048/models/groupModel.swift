//
//  groupModel.swift
//  voyager2048
//
//  Created by YananSuo on 2021/5/18.
//

import Foundation

struct GroupModel: Hashable, Codable, Identifiable {
    var id: Int
    var thumbnail: String
    var title: String
    var description: String
}

let groupData:[GroupModel] = load("group.json")
