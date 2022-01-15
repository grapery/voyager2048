//
//  voyager2048App.swift
//  voyager2048
//
//  Created by grapestree on 2021/3/12.
//

import SwiftUI

@main
struct voyager2048App: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var sessionService:SessionService = SessionServiceFactory.getService()
    @State private var showLaunchView: Bool = true
    private let newWorker: NetworkingManager
    
    init(){
        self.newWorker = NetworkManager()
        sessionService.state = .loggedIn
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch sessionService.state {
                case .loggedIn:
                    GraperyApp()
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                case .loggedOut:
                    LoginView()
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
    }
}
