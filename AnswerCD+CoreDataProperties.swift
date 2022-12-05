//
//  AnswerCD+CoreDataProperties.swift
//  Milllionaire
//
//  Created by Елена Русских on 05.12.2022.
//
//

import Foundation
import CoreData


extension AnswerCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnswerCD> {
        return NSFetchRequest<AnswerCD>(entityName: "AnswerCD")
    }

    @NSManaged public var answerText: String?
    @NSManaged public var isCorrect: Bool
    @NSManaged public var question: QuestionCD?

}

extension AnswerCD : Identifiable {

}
