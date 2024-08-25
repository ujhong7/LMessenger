//
//  Chat.swift
//  LMessenger
//
//  Created by yujaehong on 8/25/24.
//

import Foundation

struct Chat: Hashable {
    var chatId: String
    var userId: String
    var message: String?
    var photoURL: String?
    var date: Date
}
