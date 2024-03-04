//
//  Chat+CoreDataProperties.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 28/2/24.
//
//

import Foundation
import CoreData


extension Chat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Chat> {
        return NSFetchRequest<Chat>(entityName: "Chat")
    }

    @NSManaged public var title: String?
    @NSManaged public var messages: Set<Message>

}

extension Chat : Identifiable {

}
