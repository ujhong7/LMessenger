//
//  DIContainer.swift
//  LMessenger
//
//  Created by yujaehong on 8/11/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}
