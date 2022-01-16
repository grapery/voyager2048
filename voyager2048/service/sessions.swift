//
//  Sessions.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/9.
//

import Foundation
import Combine

enum SessionState {
    case loggedIn
    case loggedOut
}

struct SessionUserDetails {
    let email: String
}


protocol AuthenticationServiceProtocol {
    func login(email: String, password: String) -> AnyPublisher<Void, Error>
    func register(email: String, password: String) -> AnyPublisher<Void, Error>
    func sendPasswordReset(email: String) -> AnyPublisher<Void, Error>
}

class SessionServiceFactory {
    static func getService() -> SessionService {
        return SessionService()
    }
}

class SessionService: ObservableObject {
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDetails?
    
    func logout() {
        fatalError("This method must be overridden")
    }
}




final class FakeAuthService: AuthenticationServiceProtocol {
    func login(email: String, password: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                print("login")
            }
            
        }.eraseToAnyPublisher()
    }
    
    func register(email: String, password: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                print("register")
            }
            
        }.eraseToAnyPublisher()
    }
    
    func sendPasswordReset(email: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                print("reset password")
            }
            
        }.eraseToAnyPublisher()
    }
}




