//
//  colorExt.swift
//  voyager2048
//
//  Created by YananSuo on 2021/5/18.
//

import SwiftUI
import Foundation

extension Color {
    static var backgroundColor = Color("bgColor")
    static var darkerColor = Color("darkerColor")
    static var offColor = Color("offColor")
    static var textColor = Color("textColor")
    static var accentColor = Color("accentColor")
    static var brightYellow = Color("brightYellow")
    static var lightBlue = Color("lightBlue")
    static var purple = Color("purple")
    static var shallowOrange = Color("shallowOrange")
    static var teal = Color("teal")
}


struct Page: Identifiable {
    
    let id: UUID
    let image: String
    let heading: String
    let subSubheading: String
    
    static var getAll: [Page] {
        [
            Page(id: UUID(), image: "screen-1", heading: "Form new habits", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna."),
            Page(id: UUID(), image: "screen-2", heading: "Keep track of your progress", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna."),
            Page(id: UUID(), image: "screen-3", heading: "Setup your goals", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna."),
            Page(id: UUID(), image: "screen-4", heading: "Keep track of your progress", subSubheading: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.")
            
        ]
    }
}
