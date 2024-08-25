//
//  Chat.swift
//  LMessenger
//
//  Created by yujaehong on 8/25/24.
//

import Foundation

struct Chat: Hashable, Identifiable {
    var chatId: String
    var userId: String
    var message: String?
    var photoURL: String?
    var date: Date
    var id: String { chatId }
}
