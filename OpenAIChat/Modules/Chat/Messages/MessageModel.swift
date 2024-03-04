//
//  MessageModel.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 28/2/24.
//

import Foundation
import CoreData
import SwiftUI

//Persistence Data
class MessageModel{
    static let shared = MessageModel()
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "OpenAIChat")
        
        if inMemory{
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDesctiption, error in
            if let error {
                print("Could not load Core Data persistence stores from entity: Message", error.localizedDescription)
            }
        }
    }
    
    func saveChanges(){
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Could not save changes to Core Data from entity: Message")
            }
        }
    }
    
    func create(content: String, role: String){
        let entity = Message(context: container.viewContext)
        
        entity.content = content
        entity.role = role
    }
    
    func read(predicateFormat: String? = nil, fetchLimit: Int? = nil) -> [Message] {
        var results: [Message] = []
        
        let request = NSFetchRequest<Message>(entityName: "Message")
        
        if predicateFormat != nil {
            request.predicate = NSPredicate(format: predicateFormat!)
        }
        
        if fetchLimit != nil {
            request.fetchLimit = fetchLimit!
        }
        
        do {
            results = try container.viewContext.fetch(request)
        } catch {
            print("Could not fetch notes to Core Data from: Message")
        }
        
        return results
    }
}
