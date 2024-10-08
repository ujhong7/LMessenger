//
//  User.swift
//  LMessenger
//
//  Created by yujaehong on 8/11/24.
//

import Foundation

struct User: Identifiable {
    var id: String
    var name: String
    var phoneNumber: String?
    var profileURL: String?
    var description: String?
}

extension User {
    func toObject() -> UserObject {
        .init(id: id,
              name: name,
              phoneNumber: phoneNumber,
              profileURL: profileURL,
              description: description
        )
    }
}

// mock data
extension User {
    static var stub1: User {
        .init(id: "user1_id", name: "짱구")
    }
    
    static var stub2: User {
        .init(id: "user2_id", name: "맹구")
    }
}
