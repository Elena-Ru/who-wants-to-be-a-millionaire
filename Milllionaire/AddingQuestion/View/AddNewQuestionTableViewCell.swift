//
//  AddNewQuestionTableViewCell.swift
//  Milllionaire
//
//  Created by Елена Русских on 02.12.2022.
//

import UIKit

class AddQuestionTableViewCell: UITableViewCell {
    
    
    static let identifier = "addCell"
    
        let questionLabel: UILabel = {
            let label = UILabel()
            label.text = "Enter your question."
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
        var questionText: UITextView = {
            let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.layer.masksToBounds = true
            textView.layer.cornerRadius = 20.0
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.yellow.cgColor
            textView.font = UIFont.systemFont(ofSize: 16.0)
            textView.textColor = UIColor.black
            textView.textAlignment = NSTextAlignment.left
            textView.dataDetectorTypes = UIDataDetectorTypes.all
            textView.layer.shadowOpacity = 0.5
            textView.isEditable = true
            textView.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
            textView.becomeFirstResponder()
            return textView
        }()
    
    var correctAnswer: AnswerTextField = {
           let textField =  AnswerTextField(title: "Enter correct answer here")
           return textField
       }()
    
    var wrongAnswer1: AnswerTextField = {
           let textField =  AnswerTextField(title: "Enter wrong answer #1 here")
           return textField
       }()
    
    var wrongAnswer2: AnswerTextField = {
           let textField =  AnswerTextField(title: "Enter wrong answer #2 here")
           return textField
       }()
    
    var wrongAnswer3: AnswerTextField = {
           let textField =  AnswerTextField(title: "Enter wrong answer #3 here")
           return textField
       }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
     func setupLayout() {
         
         contentView.backgroundColor = #colorLiteral(red: 0.1470966935, green: 0.2613164783, blue: 0.4531337619, alpha: 1)
         contentView.addSubview(questionLabel)
         contentView.addSubview(questionText)
         contentView.addSubview(correctAnswer)
         contentView.addSubview(wrongAnswer1)
         contentView.addSubview(wrongAnswer2)
         contentView.addSubview(wrongAnswer3)
       
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            questionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            questionLabel.heightAnchor.constraint(equalToConstant: 20),
        
            questionText.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 12),
            questionText.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            questionText.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor),
            questionText.heightAnchor.constraint(equalToConstant: 80),
            
            correctAnswer.topAnchor.constraint(equalTo: questionText.bottomAnchor, constant: 10),
            correctAnswer.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            correctAnswer.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor),
            correctAnswer.heightAnchor.constraint(equalToConstant: 30),
            
            wrongAnswer1.topAnchor.constraint(equalTo: correctAnswer.bottomAnchor, constant: 10),
            wrongAnswer1.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            wrongAnswer1.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor),
            wrongAnswer1.heightAnchor.constraint(equalToConstant: 30),
            
            wrongAnswer2.topAnchor.constraint(equalTo: wrongAnswer1.bottomAnchor, constant: 10),
            wrongAnswer2.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            wrongAnswer2.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor),
            wrongAnswer2.heightAnchor.constraint(equalToConstant: 30),
            
            wrongAnswer3.topAnchor.constraint(equalTo: wrongAnswer2.bottomAnchor, constant: 10),
            wrongAnswer3.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            wrongAnswer3.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor),
            wrongAnswer3.heightAnchor.constraint(equalToConstant: 30)
            ])
            }

}
