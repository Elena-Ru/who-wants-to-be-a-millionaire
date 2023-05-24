//
//  GameViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit


final class GameViewController: UIViewController {
  var currentResults = Game.shared
  var difficulty: Difficulty = Game.shared.selectedDifficulty
  var currentQuestion: Question?
  var corAnswer: Int = 0
  var gameDelegate: GameViewControllerDelegate?
  var rootView = GameRootView()
  var questionsWithStrategy : [Question]!
  var data = QuestionData.shared
  
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
    view.backgroundColor = #colorLiteral(red: 0.1924170554, green: 0.0007362262113, blue: 0.3723829389, alpha: 1)
    rootView.tableView.delegate = self
    rootView.tableView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    questionsWithStrategy = self.shuffleStrategy.shuffleQuestions(questions: data.dataAll)
    currentResults.session = GameSession(correctAnswer: corAnswer, questionQuantity: questionsWithStrategy.count )
    configureUI(question: questionsWithStrategy.first!)
    rootView.tableView.reloadData()
  }
  
  func configureUI(question: Question){
    currentResults.session?.currentQuestionNumber.addObserver(self, options: [.new, .initial], closure: {
      [weak self] (numberOfQuestion, _) in
      self?.rootView.questionNumberLabel.text = "Question №\(numberOfQuestion)"
    })
    currentResults.session?.procent.addObserver(self, options: [.new, .initial], closure: {
      [weak self] (procent, _) in
      //need to localize (formated)
      let formatedNum = procent.formatted(.percent)
      self?.rootView.correctAnswerProcentLabel.text = "Success: \(formatedNum)"
    })
    rootView.questionLabel.text = question.text
    currentQuestion = question
  }
  
  private func checkAnswer( answer: Answer, question: Question) -> Bool {
    return question.answers.contains(where: { $0.text == answer.text } ) && answer.isCorrect
  }
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    currentQuestion?.answers.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard  let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else { return UITableViewCell()}
    
    cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
    cell.textLabel?.textColor = .white
    cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    cell.backgroundColor = #colorLiteral(red: 0.1470966935, green: 0.2613164783, blue: 0.4531337619, alpha: 1)
    cell.layer.borderColor = UIColor.white.cgColor
    cell.layer.borderWidth = 2
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let question = currentQuestion else { return }
    
    let answer = question.answers[indexPath.row]
    if checkAnswer(answer: answer, question: question) {
      
      if let index = questionsWithStrategy.firstIndex(where: { $0.text == question.text}) {
        
        corAnswer += 1
        
        if index < questionsWithStrategy.count - 1 {
          let nextQuestion = questionsWithStrategy[index + 1]
          currentResults.session?.currentQuestionNumber.value += 1
          currentResults.session?.procent.value = currentResults.corAnswerProcent(correctAnswerCount: corAnswer, totalQuestionCount: questionsWithStrategy.count) / 100
          configureUI(question: nextQuestion)
          tableView.reloadData()
        }
        else {
          let alert = UIAlertController(title: "Game over", message: "Congratulations! You are winner!", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            alert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true)
          }
                                       )
          )
          currentResults.session?.procent.value = currentResults.corAnswerProcent(correctAnswerCount: corAnswer, totalQuestionCount: questionsWithStrategy.count) / 100
          gameDelegate?.didEndGame(withResult: Results(procent: currentResults.session?.procent.value, correctAnswerCount: corAnswer))
          present(alert, animated: true)
          corAnswer = 0
          currentQuestion = questionsWithStrategy[0]
        }
      }
    } else {
      let alert = UIAlertController(title: "Wrong", message: "Try again", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
        alert.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true)
      }
                                   )
      )
      gameDelegate?.didEndGame(withResult: Results(procent: currentResults.session?.procent.value, correctAnswerCount: corAnswer))
      present(alert, animated: true)
      corAnswer = 0
      currentQuestion = questionsWithStrategy[0]
    }
  }
  
}

