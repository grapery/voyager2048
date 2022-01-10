//
//  login.swift
//  voyager2048
//
//  Created by grapestree on 2021/4/5.
//

import SwiftUI

struct LoginView: View {
    @State var showRegistration: Bool = false
    @State var showResetPasswordView: Bool = false
    
    @StateObject var vm: LoginViewModel = LoginViewModel(authenticationService:
                                                            FakeAuthService())
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                VStack {
                    logo
                    VStack(spacing: 20) {
                        InputTextFieldView(text: $vm.email, placeholder: "E-mail", keyboardType: .emailAddress)
                        InputPasswordView(text: $vm.password, placeholder: "Password")
                        HStack() {
                            Spacer()
                            forgotPasswordButton
                        }
                        VStack(spacing: 20) {
                            loginButton
                            registerButton
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    }
                    .sheet(isPresented: $showRegistration, content: {
                        NavigationView {
                            RegisterView()
                                .accessibilityIdentifier("RegisterView")
                        }
                    })
                    .sheet(isPresented: $showResetPasswordView, content: {
                        NavigationView {
                            ResetPasswordView()
                                .accessibilityIdentifier("ForgotPasswordView")
                        }
                    })
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                    .padding()
                }
            }
        }
        .navigationTitle("Login")
        .alert(isPresented: $vm.hasError, content: {
            if case .failed(let error) = vm.state {
                return Alert(title: Text("Error"), message: Text(error.localizedDescription))
            } else {
                return Alert(title: Text("Error"), message: Text("Something went wrong"))
            }
        })
    }
}


extension LoginView {
    private var logo: some View {
        Image("logo-transparent")
            .resizable()
            .frame(width: 100, height: 100)
    }
    
    private var loginButton: some View {
        ButtonView(label: "Login") {
            vm.login()
        }
    }
    
    private var registerButton: some View {
        ButtonView(label: "Register") {
            showRegistration.toggle()
        }
    }
    
    private var forgotPasswordButton: some View {
        Button(action: {
            showResetPasswordView.toggle()
        }, label: {
            Text("Forgot password?")
        })
    }
}
