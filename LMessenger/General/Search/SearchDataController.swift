//
//  SearchDataController.swift.swift
//  LMessenger
//
//  Created by yujaehong on 8/30/24.
//

import Foundation
import CoreData

class SearchDataController: ObservableObject {
    
    let persistantController = NSPersistentContainer(name: "Search")
    
    init() {
        persistantController.loadPersistentStores { description, error in
            if let error {
                print("Core data failed: ", error)
            }
            
            
        }
    }
    
}
