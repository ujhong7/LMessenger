//
//  ChatRoom.swift
//  LMessenger
//
//  Created by yujaehong on 8/22/24.
//

import Foundation

struct ChatRoom: Codable {
    var chatRoomId: String
    var lastMessage: String?
    var otherUserName: String
    var otherUserId: String
}
