//
//  ChatRoomService.swift
//  LMessenger
//
//  Created by yujaehong on 8/22/24.
//

import Foundation

protocol ChatRoomServiceType {
    func createChatRoomIfNeeded()
}

class ChatRoomService: ChatRoomServiceType {
    
    private let dbRepository: ChatRoomDBRepositoryType
    
    init(dbRepository: ChatRoomDBRepositoryType) {
        self.dbRepository = dbRepository
    }
}

class StubChatRoomService: ChatRoomServiceType {
    
}
