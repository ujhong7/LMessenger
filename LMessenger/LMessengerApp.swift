//
//  LMessengerApp.swift
//  LMessenger
//
//

import SwiftUI

@main
struct LMessengerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage(AppStorageType.Appearacne) var appearanceValue: Int = UserDefaults.standard.integer(forKey: AppStorageType.Appearacne)
    @StateObject var container: DIContainer = .init(services: Services())
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init(container: container),
                              navigationRouter: .init(),
                              searchDataController: .init(), 
                              appearanceController: .init(appearanceValue))
                .environmentObject(container)
        }
    }
}
