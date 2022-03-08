//
//  ViewController.swift
//  pr1
//
//  Created by Максим Клочков on 03.03.2022.
//  Урок: Swift c нуля: UIKit урок 3 - UIAlertController | Alert

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var addingLabel: UILabel!
    @IBOutlet weak var guessTheNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.hiLabel.text = "Что вы хотите сделать, "
        self.alertName(title: "Привет!", message: "Введите ваше имя", style: .alert)
    }

    // MARK: Button
    @IBAction func addButton(_ sender: Any) {
        self.alertAdding(title: "Сложить числа!", message: "Введите 1 и 2 число в полях ниже", style: .alert)
    }

    @IBAction func guessTheNumberButton(_ sender: Any) {
        alertGuessTheNumber(title: "Угадать число!", message: "Вам нужно подобрать числа так, чтобы вышло 11", style: .alert)
    }

    // MARK: Hi alert
    func alertName(title: String, message: String, style: UIAlertController.Style) {

        let allerController = UIAlertController(title: title, message: message, preferredStyle: style)

        let actinon = UIAlertAction(title: "Сохранить", style: .default) { (actinon) in
            let text = allerController.textFields?.first
            self.hiLabel.text! += ((text?.text)!) + ("?")
        }

        allerController.addTextField(configurationHandler: nil)
        allerController.addAction(actinon)
        self.present(allerController, animated: true, completion: nil)
    }

    // MARK: Adding alert
    func alertAdding(title: String, message: String, style: UIAlertController.Style) {

        let allerController = UIAlertController(title: title, message: message, preferredStyle: style)

        let actinon = UIAlertAction(title: "Сложить", style: .default) { (actinon) in
            let firstNumber = allerController.textFields?.first
            let secondNumber = allerController.textFields?[1]
            let amount = String(Int(firstNumber?.text ?? "0")! + Int(secondNumber?.text ?? "0")!)
            self.addingLabel.text = ("\(Int(firstNumber?.text ?? "0")!) + \(Int(secondNumber?.text ?? "0")!) = \(amount)")
        }

        allerController.addTextField(configurationHandler: nil)
        allerController.addTextField(configurationHandler: nil)

        allerController.addAction(actinon)
        self.present(allerController, animated: true, completion: nil)
    }

    // MARK: GuessTheNumber alert
    func alertGuessTheNumber(title: String, message: String, style: UIAlertController.Style) {

        let allerController = UIAlertController(title: title, message: message, preferredStyle: style)

        let actinon = UIAlertAction(title: "OK", style: .default) { (actinon) in

            let numberOne = allerController.textFields?.first
            let correctAnswer = "11"

            guard (Int((numberOne?.text)!) != nil) else {
                return self.guessTheNumberLabel.text! = "Введите число!"
            }

            let calculating = String(((Int(numberOne?.text ?? "")! * 4) / 6) + 7)
            let textForLabel = ("(") + (numberOne?.text)! + (" * 4") + (" / 6)") + (" + 7 = ") + (calculating)

            guard (calculating == correctAnswer) else {
                return self.guessTheNumberLabel.text! = ("Сумма должна быть \(correctAnswer): ") + (textForLabel)
            }

            self.guessTheNumberLabel.text! = ("Ответ верный: ") + textForLabel
        }

        allerController.addTextField { (textFieldZero) in
            textFieldZero.placeholder = "Введите ваше число"
        }
        allerController.addTextField { (textFieldOne) in
            textFieldOne.placeholder = " * 4"
        }
        allerController.addTextField { (textFieldTwo) in
            textFieldTwo.placeholder = " / 6"
        }
        allerController.addTextField { (textFieldThree) in
            textFieldThree.placeholder = " + 7"
        }

        allerController.addAction(actinon)
        self.present(allerController, animated: true, completion: nil)
    }
}
