//
//  ViewController.swift
//  RotationString
//
//  Created by SanazAhang on 10/7/22.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var wordTwoTextField: UITextField!
    @IBOutlet weak var wordOneTextField: UITextField!
    @IBOutlet weak var badgeButtonView: BadgeButton!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        badgeButtonView.delegate = self
        wordOneTextField.delegate = self
        wordTwoTextField.tag = 0
        wordTwoTextField.delegate = self
        wordTwoTextField.tag = 1
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        wordOneTextField.becomeFirstResponder()
    }
    
    
    //FunctionFor Focus KeyBoard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }

}

extension ViewController:CheckActionDeligate{
    
    func CheckButton(_ sender: UIButton){
        if  let firstWord = wordOneTextField.text, !firstWord.isEmpty {
            if let secondWord = wordTwoTextField.text, !secondWord.isEmpty{
                print("THIS IS:\(firstWord.isReversed(secondString: secondWord))")
                
                if(firstWord.isReversed(secondString: secondWord)){
                    counter += 1
                    badgeButtonView.badgeLabel.text = String(counter)
                    return
                }
                showAlertError(title: "RESULT", message: "This is not a string rotation!!!", buttonTitle: "ok")
            }
            showAlertError(title: "EMPTY FIELD", message: "The second filed is empty", buttonTitle: "ok")

        }
        showAlertError(title: "EMPTY FIELD", message: "The first filed is empty", buttonTitle: "ok")
       
    }
    
    //function for show Alert
    func showAlertError(title:String,message:String,buttonTitle:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

