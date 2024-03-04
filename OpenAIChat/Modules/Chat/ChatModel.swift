//
//  ChatModel.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 28/2/24.
//

import Foundation
import CoreData  

//PersistenceConrtoller

class ChatModel {
    static let shared = ChatModel()
    let container: NSPersistentContainer
    
//    class Chat: NSManagedObject{
//        var title: String = ""
//        var messages: [Message] = []
//    }
//    var chat = Chat.self
    
    init() {
        container = NSPersistentContainer(name: "Chat")
        container.loadPersistentStores{storeDescription, error in
            if let error{
                print("Could not load Core Data persistence stores from: Chat", error.localizedDescription)
            }
        }
    }
    
    func saveChanges() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            }catch{
                print("Could not save changes to Core Data from: Chat", error.localizedDescription)
            }
        }
    }
    
    func create(title: String, messages: Set<Message>){
        // creo un chat, en la UI me debe direccionar a la vista chat con el nombre de title cuando creo uno y elijo el nombre del chatt
        let entity = Chat(context: container.viewContext)
        
        entity.title = title
        entity.messages = messages
        
        saveChanges()
    }
    
    func read(predicateFormat: String? = nil, fetchLimit: Int? = nil) -> [Chat] {
        var results: [Chat] = []
        
        let request = NSFetchRequest<Chat>(entityName: "Chat")
        
        if predicateFormat != nil {
            request.predicate = NSPredicate(format: predicateFormat!)
        }
        
        if fetchLimit != nil {
            request.fetchLimit = fetchLimit!
        }
        
        do {
            results = try container.viewContext.fetch(request)
        } catch {
            print("Could not fetch notes to Core Data from: Chat")
        }
        
        return results
    }
    
    func update(entity: Chat, title: String? = nil, messages: Set<Message>? = nil){
        var hasChanges: Bool = false
        
        if title != nil {
            entity.title = title!
            hasChanges = true
        }
        if messages != nil {
            entity.messages = messages!
            hasChanges = true
        }
        
        if hasChanges {
            saveChanges()
        }
    }
    
    func delate(_ entity: Chat){
        container.viewContext.delete(entity)
        saveChanges()
    }
    
//    enum Header: String{
//        case baseUrl = "https://api.openai.com/v1/chat/completions"
//    }
    
//    func performRequest(_ messages: Message, arrayMessage: [Message]){
//        
//        //seting parameters values
//        let parameters = "model: gpt-3.5-turbo-0125 messages: \(messages) max_tokens: 256"
//        let data = try! JSONEncoder().encode(parameters)
//        //request body
//        var request = URLRequest(url: URL(string: Header.baseUrl.rawValue)!)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer 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", forHTTPHeaderField: "Authorization")
//        request.httpBody = data
//        
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//        decoder.userInfo[CodingUserInfoKey.managedObjectContextAR] = containerApiResponse.viewContext
//        
//        let task = URLSession.shared.dataTask(with: request){ data, response, error in
//            if let data = data{
//                if let decodedData = try? decoder.decode([Message].self, from: data){
//                    DispatchQueue.main.async {
//                        arrayMessage = decodedData
//                    }
//                }
//            }
//            if let error = error{
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//    }
}
