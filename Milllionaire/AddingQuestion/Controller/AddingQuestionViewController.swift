//
//  AddingQuestionViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 02.12.2022.
//

import UIKit

class AddingQuestionViewController: UIViewController {

    var rootView = AddQuestionRootView()
    var question : Question?
    var answers = [Answer]()
    var data = QuestionData.shared
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1924170554, green: 0.0007362262113, blue: 0.3723829389, alpha: 1)
        title = Texts.addQuestion
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Texts.dismiss, style: .plain, target: self, action: #selector(dismissSelf))
       
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        rootView.addButton.addTarget(self, action: #selector(addQuestion), for: .touchUpInside)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true)
    }
    
    @objc func addQuestion(sender: UIButton!) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = rootView.tableView.cellForRow(at: indexPath) as! AddQuestionTableViewCell
        let questionText = cell.questionText.text
        let correctAnswer = cell.correctAnswer.text
        let wrongAnswer1  = cell.wrongAnswer1.text
        let wrongAnswer2  = cell.wrongAnswer2.text
        let wrongAnswer3  = cell.wrongAnswer3.text
        
        if questionText == "" ||
            correctAnswer == "" ||
            wrongAnswer1 == "" ||
            wrongAnswer2 == "" ||
            wrongAnswer3 == "" {
            let alert = UIAlertController(title: "Warning", message: "Please, enter all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }
            )
            )
            present(alert, animated: true)
        } else {
        
            setAnswer(answerText: correctAnswer ?? "correct answer", answerCorrect: true)
            setAnswer(answerText: wrongAnswer1 ?? "without value", answerCorrect: false)
            setAnswer(answerText: wrongAnswer2 ?? "without value", answerCorrect: false)
            setAnswer(answerText: wrongAnswer3 ?? "without value", answerCorrect: false)
            
            question = Question(text: questionText!, answers: answers)
            data.dataUser.append(question!)
            
             let alert = UIAlertController(title: nil, message: "Your question was successfully added", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                 alert.dismiss(animated: true, completion: nil)
             }
             )
             )
             present(alert, animated: true)
         }
      }

    private func setAnswer(answerText: String, answerCorrect: Bool) {
        let answer = Answer(text: answerText, isCorrect: answerCorrect)
        answers.append(answer)
    }

}

extension AddingQuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: AddQuestionTableViewCell.identifier, for: indexPath) as? AddQuestionTableViewCell else {
            return UITableViewCell()}
        cell.setupLayout()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        400
    }
}


