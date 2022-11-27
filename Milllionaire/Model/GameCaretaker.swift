//
//  GameCaretaker.swift
//  Milllionaire
//
//  Created by Елена Русских on 27.11.2022.
//

import Foundation
import UIKit
import CoreData

class GameCaretaker {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "game"
    var resultCD : [Result]?
    var results : [Results]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveGame (_ game: [Results])  {
    
        deleteFromCD(in : "Result")
        game.forEach {
            let result = Result(context: context)
            result.procent = $0.procent!
            result.correctAnswerCount = Int16($0.correctAnswerCount!)
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
    
    
    func loadGame() -> [Results] {
        
        do {
            resultCD =  try context.fetch(Result.fetchRequest())
            results = transform(resultsFromCD: self.resultCD!)
        } catch {
            print(error)
        }
        return results!
    }
    
    private func transform( resultsFromCD: [Result]) -> [Results] {
          var results = [Results]()
        resultsFromCD.forEach {
            var result = Results()
            result.correctAnswerCount = Int($0.correctAnswerCount)
            result.procent = $0.procent
            results.append(result)
          }
          return results
      }
}
