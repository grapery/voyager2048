//
//  HomeViewModel.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/15.
//

import Foundation


class HomeModel: ObservableObject{
    @Published var defaultGroup: String = ""
    @Published var defaultProject: String = ""
    @Published var lastOffset: Int64 = 0
}

