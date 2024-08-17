//
//  Services.swift
//  LMessenger
//
//  Created by yujaehong on 8/11/24.
//

import Foundation

protocol ServiceType {
    var authService: AuthenticationServiceType { get set }
    var userService: UserServieType { get set }
    var contactService: ContactServiceType { get set }
}

class Services: ServiceType {
    var authService: AuthenticationServiceType
    var userService: UserServieType
    var contactService: ContactServiceType
    
    init() {
        self.authService = AuthenticationService()
        self.userService = UserService(dbRepository: UserDBRepository())
        self.contactService = ContactService()
    }
}

class StubService: ServiceType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    var userService: UserServieType = StubUserService()
    var contactService: ContactServiceType = StubContactService()
}
