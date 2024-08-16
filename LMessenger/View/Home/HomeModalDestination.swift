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
    
    var id: Int {
        hashValue
    }
}
