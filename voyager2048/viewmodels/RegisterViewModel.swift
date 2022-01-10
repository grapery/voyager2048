//
//  RegisterViewModel.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/9.
//

import Foundation
import Combine

enum RegistrationState {
    case successful
    case failed(error: Error)
    case na
}

final class RegisterViewModel: ObservableObject {
    private let authenticationService: AuthenticationServiceProtocol
    
    private var cancellable = Set<AnyCancellable>()
    
    @Published var state: RegistrationState = .na
    @Published var hasError: Bool = false
    
    var email: String = ""
    var password: String = ""
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
        setupErrorSubscriptions()
    }
    
    func register() {
        authenticationService
            .register(email: email, password: password)
            .sink { [weak self] response in
                switch response {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successful
            }.store(in: &cancellable)

    }
}

extension RegisterViewModel {
    func setupErrorSubscriptions() {
        $state.map { state -> Bool in
            switch state {
            case .successful, .na:
                return false
            case .failed:
                return true
            }
        }.assign(to: &$hasError)
    }
}

