//
//  helper.swift
//  voyager2048
//
//  Created by YananSuo on 2021/5/18.
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
