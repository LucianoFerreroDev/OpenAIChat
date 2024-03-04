//
//  ApiResponse+CoreDataProperties.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 27/2/24.
//
//

import Foundation
import CoreData


extension ApiResponse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ApiResponse> {
        return NSFetchRequest<ApiResponse>(entityName: "ApiResponse")
    }

    @NSManaged public var id: String?
    @NSManaged public var choices: ApiResponseChoices?

}

extension ApiResponse : Identifiable {

}
