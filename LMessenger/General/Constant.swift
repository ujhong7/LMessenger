//
//  Constant.swift
//  LMessenger
//
//  Created by yujaehong on 8/15/24.
//

import Foundation

typealias DBKey = Constant.DBKey
typealias AppStorageType = Constant.AppStorage

enum Constant { }

extension Constant {
    struct DBKey {
        static let Users = "Users"
        static let ChatRooms = "ChatRooms"
        static let Chats = "Chats"
    }
}

extension Constant {
    struct AppStorage {
        static let Appearacne = "AppStorage_Appearance"
    }
}

// Constant.DBKey.Users
// ⬇️
// DBKey.Users
