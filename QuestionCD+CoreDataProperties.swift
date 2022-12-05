//
//  QuestionCD+CoreDataProperties.swift
//  Milllionaire
//
//  Created by Елена Русских on 05.12.2022.
//
//

import Foundation
import CoreData


extension QuestionCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionCD> {
        return NSFetchRequest<QuestionCD>(entityName: "QuestionCD")
    }

    @NSManaged public var text: String?
    @NSManaged public var answers: NSSet?

}

// MARK: Generated accessors for answers
extension QuestionCD {

    @objc(addAnswersObject:)
    @NSManaged public func addToAnswers(_ value: AnswerCD)

    @objc(removeAnswersObject:)
    @NSManaged public func removeFromAnswers(_ value: AnswerCD)

    @objc(addAnswers:)
    @NSManaged public func addToAnswers(_ values: NSSet)

    @objc(removeAnswers:)
    @NSManaged public func removeFromAnswers(_ values: NSSet)

}

extension QuestionCD : Identifiable {

}
