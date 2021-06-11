//
//  login.swift
//  voyager2048
//
//  Created by grapestree on 2021/4/5.
//

import SwiftUI


struct Login: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: { login() }) {
                Text("Sign in")
            }
        }
        .padding()
        Spacer()
        GroupUIView()
    }

    func login() {
        print("\(email)")
    }
}

