//
//  ResetPasswordViewModel.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/9.
//

import Foundation
import Combine

final class ResetPasswordViewModel: ObservableObject {
    private let authenticationService: AuthenticationServiceProtocol
    
    private var cancellable = Set<AnyCancellable>()
    
    var email: String = ""
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    func forgotPassword() {
        authenticationService
            .sendPasswordReset(email: email)
            .sink { response in
                switch response {
                case .failure(let error):
                    print("Error while reseting password. \(error)")
                default: break
                }
            } receiveValue: {
                print("Sent password reset request")
            }.store(in: &cancellable)
    }
    
    func  resetPassword() {
        authenticationService
            .sendPasswordReset(email: email)
            .sink { response in
                switch response {
                case .failure(let error):
                    print("Error while reseting password. \(error)")
                default: break
                }
            } receiveValue: {
                print("Sent password reset request")
            }.store(in: &cancellable)
    }
}

