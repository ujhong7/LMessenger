//
//  HomeViewModel.swift
//  LMessenger
//
//  Created by yujaehong on 8/12/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    enum Action {
        case getUser
    }
    @Published var myUser: User?
    @Published var users: [User] = [] // [.stub1, .stub2]
    
    private var userId: String
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func send(action: Action) {
        switch action {
        case .getUser:
            // TODO:
            container.services.userService.getUser(userId: userId)
                .sink { completion in
                    // TODO:
                } receiveValue: { [weak self] user in
                    self?.myUser = user
                }.store(in: &subscriptions)

        }
    }
}
