//
//  ApiResponseChoices+CoreDataClass.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 27/2/24.
//
//

import Foundation
import CoreData

let decoderConfigurationError = DecoderConfiguartionError.self

@objc(ApiResponseChoices)
public class ApiResponseChoices: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case index, message, finish_reason, apiResponse
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContextARC] as? NSManagedObjectContext else{
            throw DecoderConfiguartionError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.index = try container.decode(Int64.self, forKey: .index)
        self.message = try container.decode(Message.self, forKey: .message)
        self.finish_reason = try container.decode(String.self, forKey: .finish_reason)
        self.apiResponse = try container.decode(ApiResponse.self, forKey: .apiResponse)
    }
}

extension CodingUserInfoKey{
    static let managedObjectContextARC = CodingUserInfoKey(rawValue: "managedObjectContext")!
}
