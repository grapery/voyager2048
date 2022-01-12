//
//  GroupService.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/12.
//

import Foundation


protocol GroupService{
    func getGroup()
    func getGroupByName()
    func getGroupByRank()
    func getGroupByUserJoined()
}
