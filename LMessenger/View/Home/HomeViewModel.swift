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
        case load
        case requestContacts
        case presentMyProfileView
        case presentOtherProfileView(String)
        case presentView(HomeModalDestination)
        case goToChat(User)
    }
    
    @Published var myUser: User?
    @Published var users: [User] = [] // [.stub1, .stub2]
    @Published var phase: Phase = .notRequested
    @Published var modalDestination: HomeModalDestination?
    
    var userId: String
    
    private var container: DIContainer
    private var navigationRouter: NavigationRouter
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, navigationRouter: NavigationRouter, userId: String) {
        self.container = container
        self.navigationRouter = navigationRouter
        self.userId = userId
    }
    
    func send(action: Action) {
        switch action {
        case .load:
            phase = .loading
            container.services.userService.getUser(userId: userId)
                .handleEvents(receiveOutput: { [weak self] user in
                    self?.myUser = user
                })
                .flatMap { user in
                    self.container.services.userService.loadUsers(id: user.id)
                }
                .sink { [weak self] completion in
                    if case .failure = completion {
                        self?.phase = .fail
                    }
                } receiveValue: { [weak self] users in
                    self?.phase = .success
                    self?.users = users
                }.store(in: &subscriptions)
            
        case .requestContacts:
            container.services.contactService.fetchContacts()
                .flatMap { users in
                    self.container.services.userService.addUserAfterContact(users: users)
                }.flatMap { _ in
                    self.container.services.userService.loadUsers(id: self.userId)
                }
                .sink { [weak self] completion in
                    if case .failure = completion {
                        self?.phase = .fail
                    }
                } receiveValue: { [weak self] users in
                    self?.phase = .success
                    self?.users = users
                }.store(in: &subscriptions)

        case .presentMyProfileView:
            modalDestination = .myProfile
            
        case let .presentOtherProfileView(userId):
            modalDestination = .otherProfile(userId)
            
        case .presentView(_): break
            
        case let .goToChat(otherUser):
            // ChatRooms/myUserId/otherUserId
            container.services.chatRoomService.createChatRoomIfNeeded(myUserId: userId, otherUserId: otherUser.id, otherUserName: otherUser.name)
                .sink { completion in
                    
                } receiveValue: { [weak self] chatRoom in
                    guard let `self` = self else { return }
                    self.navigationRouter.push(to: .chat(chatRoomId: chatRoom.chatRoomId,
                                                         myUserId: self.userId,
                                                         otherUserId: otherUser.id))
                }.store(in: &subscriptions)
    
        }
    }
}
