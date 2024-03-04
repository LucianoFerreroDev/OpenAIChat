//
//  ApiResponseChoices+CoreDataProperties.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 27/2/24.
//
//

import Foundation
import CoreData


extension ApiResponseChoices {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ApiResponseChoices> {
        return NSFetchRequest<ApiResponseChoices>(entityName: "ApiResponseChoices")
    }

    @NSManaged public var index: Int64
    @NSManaged public var finish_reason: String?
    @NSManaged public var message: Message?
    @NSManaged public var apiResponse: ApiResponse?

}

extension ApiResponseChoices : Identifiable {

}
