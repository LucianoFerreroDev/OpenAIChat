//
//  Message+CoreDataProperties.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 27/2/24.
//
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var content: String?
    @NSManaged public var role: String?
    @NSManaged public var apiResponseChoices: ApiResponseChoices?

}

extension Message : Identifiable {

}
