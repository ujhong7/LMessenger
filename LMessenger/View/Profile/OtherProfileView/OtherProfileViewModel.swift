//
//  OtherProfileViewModel.swift
//  LMessenger
//
//  Created by yujaehong on 8/22/24.
//

import Foundation

@MainActor
class OtherProfileViewModel: ObservableObject {
    
    @Published var userInfo: User?
    
    private var userId: String
    private var container: DIContainer
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func getUser() async {
        if let user = try? await container.services.userService.getUser(userId: userId) {
            userInfo = user
        }
    }
}
