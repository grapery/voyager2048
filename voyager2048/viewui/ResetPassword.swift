//
//  ResetPassword.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/10.
//


import SwiftUI

struct ResetPasswordView: View {
    @StateObject var vm: ResetPasswordViewModel = ResetPasswordViewModel(authenticationService: FakeAuthService())
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                VStack {
                    VStack() {
                        InputTextFieldView(text: $vm.email, placeholder: "E-mail", keyboardType: .emailAddress)
                        sendPasswordResetButton
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    }
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                    .padding()
                }
            }
        }
        .navigationTitle("Reset password")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("reset")
                }, label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                })
            }
        }
    }
}


extension ResetPasswordView {
    private var logo: some View {
        Image("logo-transparent")
            .resizable()
            .frame(width: 100, height: 100)
    }
    
    private var sendPasswordResetButton: some View {
        ButtonView(label: "Send password reset") {
            
        }
    }
}
