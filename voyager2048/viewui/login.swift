//
//  login.swift
//  voyager2048
//
//  Created by grapestree on 2021/4/5.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image(".circle")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.green, lineWidth: 4))
            .shadow(radius: 10)
    }
}


struct login: View {
    var body: some View {
        CircleImage().offset(x: 0, y: -100)
            .padding(.bottom, -130)
            .padding(40).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
