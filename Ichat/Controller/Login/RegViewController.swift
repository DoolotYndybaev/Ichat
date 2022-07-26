//
//  RegViewController.swift
//  Ichat
//
//  Created by Doolot on 26/7/22.
//

import UIKit

class RegViewController: UIViewController {
    var tapGest: UITapGestureRecognizer?
    var checkdield = CheckField.shared
    var service = Service.shared
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var rePasswordView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)

    }
    @objc func endEditing() {
        self.view.endEditing(true)
    }
    @IBAction func backGreetVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GreetViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func regBtnClick(_ sender: Any) {
        if checkdield.validField(emailView, emailField), checkdield.validField(passwordView, passwordField)
        {
            if passwordField.text == rePasswordField.text
            {
                service.createNewUser(LoginField(email: emailField.text!, password: passwordField.text!)) { code in
                    switch code.code {
                    case 0:
                        print("Произошла ошибка регистрации")
                    case 1:
                        print("Успешно зарегистрировались")
                        self.service.configureEmail()
                    default:
                        print("Неизвестная ошибка")
                    }
                }
            } else {
                print("Пароли не совпадают")
            }
        }
    }

}
