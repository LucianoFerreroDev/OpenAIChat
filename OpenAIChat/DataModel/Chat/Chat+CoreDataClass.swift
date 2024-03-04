//
//  Chat+CoreDataClass.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 28/2/24.
//
//

import Foundation
import CoreData

let decoderConfigurationErrorC = DecoderConfiguartionError.self

@objc(Chat)
public class Chat: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey{
        case messages, title
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContextC] as? NSManagedObjectContext else{
            throw DecoderConfiguartionError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decode(Set<Message>.self, forKey: .messages)
        self.title = try container.decode(String.self, forKey: .title)
    }
}

extension CodingUserInfoKey{
    static let managedObjectContextC = CodingUserInfoKey(rawValue: "managedObjectContext")!
}
