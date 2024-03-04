//
//  Message+CoreDataClass.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 27/2/24.
//
//

import Foundation
import CoreData

let decoderConfigurationErrorM = DecoderConfiguartionError.self


@objc(Message)
public class Message: NSManagedObject, Decodable{
    enum CodingKeys: CodingKey {
        case content, role, ofConversation, apiResponseChoices
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContextM] as? NSManagedObjectContext else{
            throw DecoderConfiguartionError.missingManagedObjectContext
        }
        
        self.init(context: context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.role = try container.decode(String.self, forKey: .role)
        self.apiResponseChoices = try container.decode(ApiResponseChoices.self, forKey: .apiResponseChoices)
    }
}
extension CodingUserInfoKey{
    static let managedObjectContextM = CodingUserInfoKey(rawValue: "managedObjectContext")!
}
