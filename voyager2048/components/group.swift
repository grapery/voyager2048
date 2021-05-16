//
//  group.swift
//  voyager2048
//
//  Created by grapestree on 2021/4/5.
//

import SwiftUI

struct group: View {
    var body: some View {
        Text("Hello, World!").foregroundColor(.green)
    }
}

struct group_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            group()
            user()
        }.navigationBarItems(leading: group())
    }
}
