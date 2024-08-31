//
//  HomeModalDestination.swift
//  LMessenger
//
//  Created by yujaehong on 8/17/24.
//

import Foundation

enum HomeModalDestination: Hashable, Identifiable {
    case myProfile
    case otherProfile(String)
    case setting
    
    var id: Int {
        hashValue
    }
}
