//
//  NavigationRouter.swift
//  LMessenger
//
//  Created by yujaehong on 8/22/24.
//

import Foundation

class NavigationRouter: ObservableObject {
    
    @Published var destination: [NavigationDestination] = []
    
    func push(to view: NavigationDestination) {
        destination.append(view)
    }
    
    func pop() {
        _ = destination.popLast()
    }
    
    func popToRootView() {
        destination = []
    }
    
}
