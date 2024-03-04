//
//  ApiResponse+CoreDataClass.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 27/2/24.
//
//

import Foundation
import CoreData

enum DecoderConfiguartionError: Error{
    case missingManagedObjectContext
}

@objc(ApiResponse)
public class ApiResponse: NSManagedObject, Decodable{

    enum CodingKeys: CodingKey{
        case id, choices
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContextAR] as? NSManagedObjectContext else{
            throw DecoderConfiguartionError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.choices = try container.decode(ApiResponseChoices.self, forKey: .choices)
    }
}

extension CodingUserInfoKey{
    static let managedObjectContextAR = CodingUserInfoKey(rawValue: "managedObjectContext")!
}
