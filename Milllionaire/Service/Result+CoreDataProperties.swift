//
//  Result+CoreDataProperties.swift
//  Milllionaire
//
//  Created by Елена Русских on 27.11.2022.
//
//

import Foundation
import CoreData

extension Result {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Result> {
        return NSFetchRequest<Result>(entityName: "Result")
    }

    @NSManaged public var procent: Double
    @NSManaged public var correctAnswerCount: Int16

}

extension Result: Identifiable {

}
