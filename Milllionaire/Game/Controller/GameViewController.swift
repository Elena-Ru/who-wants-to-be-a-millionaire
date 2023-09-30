//
//  GameViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit
import RswiftResources

protocol GameViewControllerDelegate: AnyObject {
    
    func didEndGame ( withResult result: Results)
}

final class GameViewController: UIViewController {

    var currentResults = Game.shared
    var difficulty: Difficulty = Game.shared.selectedDifficulty
    var currentQuestion: Question?
    var corAnswer: Int = 0
    var gameDelegate: GameViewControllerDelegate?
    var rootView = GameRootView()
    var questionsWithStrategy: [Question]!
    var data = QuestionData.shared
    private var router: GameRouter!
   
    private var shuffleStrategy: ShuffleStrategy {
        switch self.difficulty {
        case .easy:
            return EasyQuestionStrategy()
        case .medium:
            return MediumQuestionStrategy()
        }
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        router = GameRouter(viewController: self)
        view.backgroundColor = R.color.background()
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questionsWithStrategy = self.shuffleStrategy.shuffleQuestions(questions: data.dataAll)
        currentResults.session = GameSession(correctAnswer: corAnswer, questionQuantity: questionsWithStrategy.count )
        configureUI(question: questionsWithStrategy.first!)
        rootView.tableView.reloadData()
    }

    func configureUI(question: Question) {
        currentResults.session?.currentQuestionNumber.addObserver(self, options: [.new, .initial], closure: { [weak self] (numberOfQuestion, _) in
          self?.rootView.questionNumberLabel.text = String(format: Texts.question, numberOfQuestion)
        })
        currentResults.session?.procent.addObserver(self, options: [.new, .initial], closure: { [weak self] (procent, _) in
            self?.rootView.correctAnswerProcentLabel.text = String(format: Texts.success, procent)
        })
        rootView.questionLabel.text = question.text
        currentQuestion = question
    }
 
    private func checkAnswer( answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: { $0.text == answer.text }) && answer.isCorrect
    }
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        currentQuestion?.answers.count ?? 0
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else { return UITableViewCell() }
    
        cell.textLabel?.text = currentQuestion?.answers[indexPath.section].text
        cell.textLabel?.textColor = R.color.title()
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    
        cell.contentView.backgroundColor = R.color.accent()
        cell.contentView.layer.cornerRadius = 20.0
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = R.color.darkOrange()?.cgColor
        cell.contentView.clipsToBounds = true
  
        cell.backgroundColor = .clear
        cell.layer.borderWidth = 0
    
        return cell
    }
  
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         10.0
    }
  
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
        guard let question = currentQuestion else { return }
        handleAnswerSelection(for: question, at: indexPath.section)
    }
    
    private func handleAnswerSelection(for question: Question, at index: Int) {
        let answer = question.answers[index]
      
        if checkAnswer(answer: answer, question: question) {
          handleCorrectAnswer(for: question)
        } else {
          handleIncorrectAnswer()
        }
    }

    private func handleCorrectAnswer(for question: Question) {
        guard let index = questionsWithStrategy.firstIndex(where: { $0.text == question.text }) else { return }
        
        corAnswer += 1
        if index < questionsWithStrategy.count - 1 {
            goToNextQuestion(from: index)
        } else {
            finishGameSuccessfully()
        }
    }

    private func goToNextQuestion(from index: Int) {
        let nextQuestion = questionsWithStrategy[index + 1]
        currentResults.session?.currentQuestionNumber.value += 1
        currentResults.session?.procent.value = currentResults.corAnswerProcent(correctAnswerCount: corAnswer, totalQuestionCount: questionsWithStrategy.count)
        configureUI(question: nextQuestion)
        rootView.tableView.reloadData()
    }
  
    private func finishGameSuccessfully() {
        router.presentAlert(title: Texts.gameOver, message: Texts.congratulations) {
            self.router.closeGame()
            self.gameDelegate?.didEndGame(withResult: Results(procent: self.currentResults.session?.procent.value, correctAnswerCount: self.corAnswer))
        }
        currentResults.session?.procent.value = currentResults.corAnswerProcent(correctAnswerCount: corAnswer, totalQuestionCount: questionsWithStrategy.count)
        gameDelegate?.didEndGame(withResult: Results(procent: currentResults.session?.procent.value, correctAnswerCount: corAnswer))
        corAnswer = 0
        currentQuestion = questionsWithStrategy[0]
    }

    private func handleIncorrectAnswer() {
        router.presentAlert(title: Texts.wrong, message: Texts.tryAgain) {
            self.router.closeGame()
            self.gameDelegate?.didEndGame(withResult: Results(procent: self.currentResults.session?.procent.value, correctAnswerCount: self.corAnswer))
        }
        gameDelegate?.didEndGame(withResult: Results(procent: currentResults.session?.procent.value, correctAnswerCount: corAnswer))
        corAnswer = 0
        currentQuestion = questionsWithStrategy[0]
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (tableView.frame.size.height - 30 ) / 4
    }
    
}
