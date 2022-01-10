//
//  register.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/10.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var vm: RegisterViewModel = RegisterViewModel(authenticationService: FakeAuthService())
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                VStack {
                    logo
                    VStack(spacing: 20) {
                        InputTextFieldView(text: $vm.email, placeholder: "E-mail", keyboardType: .emailAddress)
                        InputPasswordView(text: $vm.password, placeholder: "Password")
                        registerButton
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    }
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                    .padding()
                }
            }
        }
        .navigationTitle("Register")
        .alert(isPresented: $vm.hasError, content: {
            if case .failed(let error) = vm.state {
                return Alert(title: Text("Error"), message: Text(error.localizedDescription))
            } else {
                return Alert(title: Text("Error"), message: Text("Something went wrong"))
            }
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("register")
                }, label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                })
            }
        }
    }
}


extension RegisterView {
    private var logo: some View {
        Image("logo-transparent")
            .resizable()
            .frame(width: 100, height: 100)
    }
    
    private var registerButton: some View {
        ButtonView(label: "Register") {
            vm.register()
        }
    }
}
