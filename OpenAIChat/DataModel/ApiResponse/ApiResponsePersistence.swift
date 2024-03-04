//
//  ApiResponsePersistence.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 29/2/24.
//

import Foundation
import CoreData

class ApiResponsePersistence {
    static let shared = ApiResponsePersistence()
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ApiResponse")
        container.loadPersistentStores{storeDescription, error in
            if let error{
                print("Could not load Core Data persistence stores from: ApiResponse", error.localizedDescription)
            }
        }
    }
}
