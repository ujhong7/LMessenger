//
//  ChatData.swift
//  LMessenger
//
//  Created by yujaehong on 8/25/24.
//

import Foundation

struct ChatData: Hashable, Identifiable {
    var dateStr: String
    var chats: [Chat]
    var id: String { dateStr }
}
