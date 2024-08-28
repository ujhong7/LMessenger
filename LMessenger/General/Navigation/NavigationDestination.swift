//
//  NavigationDestination.swift
//  LMessenger
//
//  Created by yujaehong on 8/22/24.
//

import Foundation

enum NavigationDestination: Hashable {
    case chat(chatRoomId: String, myUserId: String, otherUserId: String)
    case search(userId: String)
}
