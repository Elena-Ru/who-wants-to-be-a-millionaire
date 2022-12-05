//
//  QuestionData.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import Foundation

class QuestionData {
    
    static let shared = QuestionData()
    
    private let questionCaretaker = QuestionDataCaretracker()
    
    var data: [Question] = [
        Question(text: "What sort of animal is Walt Disney's Dumbo?", answers: [Answer(text: "Deer", isCorrect: false),
                                                                                Answer(text: "Rabbit", isCorrect: false),
                                                                                Answer(text: "Elephant", isCorrect: true),
                                                                                Answer(text: "Donkey", isCorrect: false)
                                                                               ]
                ),
        Question(text: "In the UK, the abbreviation NHS stands for National what Service?", answers: [Answer(text: "Health", isCorrect: true),
                                                                                Answer(text: "Humanity", isCorrect: false),
                                                                                Answer(text: "Honour", isCorrect: false),
                                                                                Answer(text: "Household", isCorrect: false)
                                                                               ]
                ),
        Question(text: "Which Disney character famously leaves a glass slipper behind at a royal ball?", answers: [Answer(text: "Cinderella", isCorrect: true),
                                                                                Answer(text: "Pocahontas", isCorrect: false),
                                                                                Answer(text: "Sleeping Beauty", isCorrect: false),
                                                                                Answer(text: "Elsa", isCorrect: false)
                                                                               ]
                ),
        Question(text: "What name is given to the revolving belt machinery in an airport that delivers checked luggage from the plane to baggage reclaim?", answers: [Answer(text: "Carousel", isCorrect: true),
                                                                                Answer(text: "Concourse", isCorrect: false),
                                                                                Answer(text: "Terminal", isCorrect: false),
                                                                                Answer(text: "Hangar", isCorrect: false)
                                                                               ]
                ),
        Question(text: "Which of these brands was chiefly associated with the manufacture of household locks?", answers: [Answer(text: "Chubb", isCorrect: true),
                                                                                Answer(text: "Phillips", isCorrect: false),
                                                                                Answer(text: "Flymo", isCorrect: false),
                                                                                Answer(text: "Ronseal", isCorrect: false)
                                                                               ]
                )
    ]
    
    var dataUser: [Question] {
        didSet {
            questionCaretaker.saveQuestions(self.dataUser)
        }
    }
    
    var dataAll: [Question]{
         self.data + self.dataUser
    }
    
    private init() {
        self.dataUser = self.questionCaretaker.loadQuestions()
    }
    
}
