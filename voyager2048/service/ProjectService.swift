//
//  ProjectService.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/12.
//

import Foundation


protocol ProjectService {
    func getGroupProject()
    func getProjectInfo()
    func getProjectSetting()
    func getProjectPaticpents()
    func getProjectWatcher()
    
    func getProjectDiscuss()
    func getProjectTodo()
    func getProjectIssues()
}


