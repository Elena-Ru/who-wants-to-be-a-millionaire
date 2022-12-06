//
//  QuestionDataCaretracker.swift
//  Milllionaire
//
//  Created by Елена Русских on 05.12.2022.
//

import Foundation
import UIKit
import CoreData

class QuestionDataCaretracker {
    
    var questionData: [Question]?
    var questionCD: [QuestionCD]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveQuestions(_ questions: [Question]) {
        
        deleteFromCD(in : "QuestionCD")
        questions.forEach {
            let qt = QuestionCD(context: context)
            qt.text = $0.text
            
            $0.answers.forEach {
                let ans = AnswerCD(context: context)
                ans.answerText = $0.text
                ans.isCorrect = $0.isCorrect
                qt.addToAnswers(ans)
            }
        }
        do {
             try  context.save()
        } catch {
            print(error)
        }
    }
    
    func deleteFromCD(in entity : String) {
        
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
            } catch {
                    print ("There was an error")
            }
    }
    
    func loadQuestions() -> [Question] {

        do {
            questionCD =  try context.fetch(QuestionCD.fetchRequest())
            questionData = transform(resultsFromCD: self.questionCD!)
        } catch {
            print(error)
        }
        return questionData!
    }

    private func transform( resultsFromCD: [QuestionCD]) -> [Question] {
          var questions = [Question]()
        
        resultsFromCD.forEach {
            var answersCD = [Answer]()
            let text = $0.text
            let setAnswers = $0.answers
            let  answArray = setAnswers?.allObjects as! [AnswerCD]
            
            answArray.forEach {
                let answerText = $0.answerText
                let answerIsCorrect = $0.isCorrect
                let answer = Answer(text: answerText ?? "1+1=?", isCorrect: answerIsCorrect)
                answersCD.append(answer)
            }
            let qtn = Question(text: text!, answers: answersCD)
            questions.append(qtn)
          }
          return questions
      }
    
}
