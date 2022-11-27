//
//  GameViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit

protocol GameViewControllerDelegate: class {
    
    func didEndGame ( withResult result: Results)
}


class GameViewController: UIViewController {
    
    let data = QuestionData().data
    
    var currentResults = Game.shared
    var currentQuestion: Question?
    var corAnswer: Int = 0
    var gameDelegate: GameViewControllerDelegate?
    
    private var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentResults.session = GameSession(correctAnswer: corAnswer, questionQuantity: data.count )
        
        view.backgroundColor = #colorLiteral(red: 0.1924170554, green: 0.0007362262113, blue: 0.3723829389, alpha: 1)
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        configureUI(question: data.first!)
    }

    func configureUI(question: Question){
        questionLabel.text = question.text
        currentQuestion = question
    }
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = #colorLiteral(red: 0.2763207555, green: 0.1030554697, blue: 0.3165085614, alpha: 1)
        topImageContainerView.layer.cornerRadius = 30
        topImageContainerView.layer.borderWidth = 2
        topImageContainerView.layer.borderColor = UIColor.yellow.cgColor
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(questionLabel)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            questionLabel.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor, constant: 12),
            questionLabel.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor, constant: -12),
            
            
            tableView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 12)
            
        ])
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
            
            if let index = data.firstIndex(where: { $0.text == question.text}) {
                
                corAnswer += 1
                
                if index < data.count - 1 {
                    let nextQuestion = data[index + 1]
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
                    let procent =  currentResults.corAnswerProcent(correctAnswerCount: corAnswer, totalQuestionCount: data.count)
                    gameDelegate?.didEndGame(withResult: Results(procent: procent, correctAnswerCount: corAnswer))
                    present(alert, animated: true)
                    corAnswer = 0
                    currentQuestion = data[0]
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
            let procent =  currentResults.corAnswerProcent(correctAnswerCount: corAnswer, totalQuestionCount: data.count)
            gameDelegate?.didEndGame(withResult: Results(procent: procent, correctAnswerCount: corAnswer))
            present(alert, animated: true)
            corAnswer = 0
            currentQuestion = data[0]
        }
        tableView.reloadData()
    }
    
}

